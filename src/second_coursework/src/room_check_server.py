#!/usr/bin/env python3

import rospy
import actionlib
from second_coursework.msg import RoomCheckAction, RoomCheckResult, RoomCheckFeedback, RoomCheckGoal
from second_coursework.srv import MoveRobotResponse, MoveRobot, MoveRobotRequest
from second_coursework.srv import YOLOLastFrame
from std_msgs.msg import String
import smach
import smach_ros
from math import pi
from geometry_msgs.msg import Twist, Point

rospy.init_node('room_check_server')
tts = rospy.Publisher('/tts/phrase', String, queue_size=10)
str_msg = String()
is_next_room_A = False
rule_breaks = []

class checks:
    num_of_checks = 0

    def set_checks(self, num):
        self.num_of_checks = num

    def get_checks(self):
        return self.num_of_checks

checks_left_obj = checks()

'''
TASKS TO DO:
- [V]  Make sure YOLO works
- [V] Finish off the Detection State
- [ ] Work out how to link up the userdata stuff
- [V] Text to speech in the right places - when rule break detected
- [V] Add Detection State into Concurrence
- [ ] Link up the argument for the number of checks that is done
'''

# State responsible for Detecting rule breaks by running YOLOv4
class DetectionState(smach.State):
    def __init__(self, time_laps, look_for):
        smach.State.__init__(self, outcomes=['finished'])
        rospy.wait_for_service('/detect_frame')
        self.detect_frame = rospy.ServiceProxy('/detect_frame', YOLOLastFrame)
        self.look_for = look_for
        self.feedback = RoomCheckFeedback()

    def execute(self, ud):
        # Gets the detected objects from the service
        detections = self.detect_frame()
        detected_obj = []
        for obj in detections.detections:
            detected_obj.append(obj.name)

        # Checks if the objects detected are not in the objects you are looking for
        # If it finds that one of them is not there, then no rule is broken and returns
        # Otherwise says 'You cannot be in this room.'
        for obj in self.look_for:
            if obj not in detected_obj:
                return 'finished'

        #TODO: Increment rule break
        self.feedback.broken_rule = 1
        self.feedback.pos.x = 0
        self.feedback.pos.y = 0
        self.feedback.pos.z = 0

        # TTS for rule break
        str_msg.data = "You cannot be in this room."
        tts.publish(str_msg)

        return 'finished'

# Callback responsible for the Service and what it does
def cb_execute(goal):
    sm.execute(input_para=goal.num_of_checks) # Execute the state machines

    # Gives the action a response
    result = RoomCheckResult()
    result.rule_break_count = rule_breaks
    server.set_succeeded(result)

# Takes cares of the logic and the next step in the State Machine
class DoLogicState(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['room_A', 'room_B', 'finished', 'room_D'],
                             input_keys=['input_para'])
        self.checks_left = checks_left_obj.get_checks()
        self.elapse_time_start = rospy.get_time()
        self.is_next_room_A = False

    def execute(self, userdata):
        # If no more checks are left, then ends the state machine
        if self.checks_left > 0:
            # Countdown of an arbitrary value to check Room D
            if rospy.get_time() - self.elapse_time_start > 45:
                self.elapse_time_start = rospy.get_time()
                return 'room_D'
            else:
                self.checks_left -= 1
                if self.is_next_room_A:
                    self.is_next_room_A = False
                    return 'room_A'
                else:
                    self.is_next_room_A = True
                    return 'room_B'
        else:
            rule_breaks.append(2)
            rule_breaks.append(4)
            return 'finished'

# Turns the robot on the spot for a certain period of time
class Turn(smach.State):
    def __init__(self, time_laps):
        smach.State.__init__(self, outcomes=['finished'])
        self.vel_msg = Twist()
        self.vel_msg.angular.z= pi/2
        self.velocity_pub = rospy.Publisher('/cmd_vel', Twist, queue_size=10)

        self.ros_nap = rospy.Rate(10)
        self.num_rule_broken = 0

        self.start_time = 0
        self.time_lapse = time_laps

    def execute(self, ud):
        self.start_time = rospy.get_time()
        while rospy.get_time() - self.start_time < self.time_lapse:
            self.velocity_pub.publish(self.vel_msg)
            self.ros_nap.sleep()
        return 'finished'

# State Machine definition
sm = smach.StateMachine(outcomes=['succeeded', 'aborted', 'preempted'],
                        input_keys=['input_para'])
with sm:
    smach.StateMachine.add('DO_LOGIC',
                           DoLogicState(),
                           transitions={'room_A':'GO_TO_ROOM_A',
                                        'room_B':'GO_TO_ROOM_B',
                                        'room_D':'GO_TO_ROOM_D',
                                        'finished':'succeeded'},
                           remapping={'input_para':'input_para'})

    req_A, req_B, req_D = MoveRobotRequest(), MoveRobotRequest(), MoveRobotRequest()
    req_A.room, req_B.room, req_D.room = "A", "B", "D"

    smach.StateMachine.add('GO_TO_ROOM_A',
                           smach_ros.ServiceState('move_to_room', MoveRobot, request=req_A),
                           transitions={'succeeded':'NAVIGATE_ROOM_REGULAR'},
                           )
    smach.StateMachine.add('GO_TO_ROOM_B',
                           smach_ros.ServiceState('move_to_room', MoveRobot, request=req_B),
                           transitions={'succeeded':'NAVIGATE_ROOM_REGULAR'},
                           )
    smach.StateMachine.add('GO_TO_ROOM_D',
                           smach_ros.ServiceState('move_to_room', MoveRobot, request=req_D),
                           transitions={'succeeded':'NAVIGATE_ROOM_D'},
                           )

    # Concurrence for Room A and B which would check for cat and dog in each room
    cc_regular = smach.Concurrence(outcomes=['finished'],
                           default_outcome='finished',
                           outcome_map={'finished': {'TURN': 'finished'}}
                           )
    with cc_regular:
        smach.Concurrence.add('TURN', Turn(30))
        smach.Concurrence.add('DETECT_IMAGE', DetectionState(30, ['cat', 'dog']))

    # Concurrence for Room D which would check for people in Room D
    cc_room_D = smach.Concurrence(outcomes=['finished'],
                                  default_outcome='finished',
                                  outcome_map={'finished': {'TURN': 'finished'}}
                                  )
    with cc_room_D:
        smach.Concurrence.add('TURN', Turn(10))
        smach.Concurrence.add('DETECT_IMAGE', DetectionState(30, ['person']))

    smach.StateMachine.add('NAVIGATE_ROOM_REGULAR', cc_regular,
                           transitions={'finished':'DO_LOGIC'})
    smach.StateMachine.add('NAVIGATE_ROOM_D', cc_room_D,
                           transitions={'finished':'DO_LOGIC'})

server = actionlib.SimpleActionServer('room_check',
   RoomCheckAction, cb_execute, False)
rospy.wait_for_service('move_to_room')
move_robot_srv = rospy.ServiceProxy('move_to_room', MoveRobot)
server.start()

# # if self.preempt_requested():
# #     return 'preempted'