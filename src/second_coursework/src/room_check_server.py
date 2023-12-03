#!/usr/bin/env python3

import rospy
import actionlib
from second_coursework.msg import RoomCheckAction, RoomCheckResult
from second_coursework.srv import MoveRobotResponse, MoveRobot, MoveRobotRequest
from sensor_msgs.msg import Image
from std_msgs.msg import String
import smach
import smach_ros
from math import pi
from geometry_msgs.msg import Twist

rospy.init_node('room_check_server')
tts = rospy.Publisher('/tts/phrase', String)
str_msg = String()
num_of_checks = 0
is_next_room_A = False
rule_breaks = []

'''
TASKS TO DO:
- Make sure YOLO works
- Finish off the Detection State
- Work out how to link up the userdata stuff
- Text to speech in the right places - when rule break detected
- Add Detection State into Concurrence
'''


# class DetectionState(smach.State):
#     def __init__(self):
#         smach.State.__init__(self, outcomes=['finished'])
#         self.camera = rospy.Subscriber('/camera/image', Image, self.img_callback)
#         self.cv_image = None
#         self.detected_objects = None
#         self.bridge = CvBridge()
#         self.detector = Detector(gpu_id=0, config_path='/opt/darknet/cfg/yolov4.cfg',
#                                  weights_path='/opt/darknet/yolov4.weights',
#                                  lib_darknet_path='/opt/darknet/libdarknet.so',
#                                  meta_path='/home/rm/darknet/build/darknet/x64/data/coco.data')
#
#     def execute(self, ud):
#
#         return 'finished'
#
#     def img_callback(self, msg):
#         self.cv_image = self.bridge.imgmsg_to_cv2(msg, desired_encoding='passthrough')
#         self.detected_objects = self.detector(self.cv_image)
#
#     def yolo_services(self, request):
#         if not self.cv_image:
#             return False
#
#         return True
#

class RoomCheckServer:
    def __init__(self):
        self.server = actionlib.SimpleActionServer('room_check',
           RoomCheckAction, self.execute, False)
        rospy.wait_for_service('move_to_room')
        self.move_robot_srv = rospy.ServiceProxy('move_to_room', MoveRobot)
        self.server.start()

    def execute(self, goal):
        states_result = sm.execute()
        result = RoomCheckResult()
        result.rule_break_count = rule_breaks
        self.server.set_succeeded(result)

class DoLogicState(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['room_A', 'room_B', 'finished', 'room_D'])
        self.checks_left = num_of_checks
        self.elapse_time_start = rospy.get_time()
        self.is_next_room_A = False

    def execute(self, userdata):
        str_msg.data = "I am doing logic"
        tts.publish(str_msg)
        if self.checks_left > 0:
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

sm = smach.StateMachine(outcomes=['succeeded', 'aborted', 'preempted'])
with sm:
    smach.StateMachine.add('DO_LOGIC',
                           DoLogicState(),
                           transitions={'room_A':'GO_TO_ROOM_A',
                                        'room_B':'GO_TO_ROOM_B',
                                        'room_D':'GO_TO_ROOM_D',
                                        'finished':'succeeded'})

    req_A, req_B, req_D = MoveRobotRequest(), MoveRobotRequest(), MoveRobotRequest()
    req_A.room, req_B.room, req_D.room = "A", "B", "D"

    smach.StateMachine.add('GO_TO_ROOM_A',
                           smach_ros.ServiceState('move_to_room', MoveRobot, request=req_A),
                           transitions={'succeeded':'NAVIGATE_ROOM_REGULAR'})
    smach.StateMachine.add('GO_TO_ROOM_B',
                           smach_ros.ServiceState('move_to_room', MoveRobot, request=req_B),
                           transitions={'succeeded':'NAVIGATE_ROOM_REGULAR'})
    smach.StateMachine.add('GO_TO_ROOM_D',
                           smach_ros.ServiceState('move_to_room', MoveRobot, request=req_D),
                           transitions={'succeeded':'NAVIGATE_ROOM_D'})

    cc_regular = smach.Concurrence(outcomes=['finished'],
                           default_outcome='finished',
                           outcome_map={'finished': {'TURN': 'finished'}}
                           )
    with cc_regular:
        smach.Concurrence.add('TURN', Turn(30))
        # smach.Concurrence.add('DETECT_IMAGE', DetectionState())


    cc_room_D = smach.Concurrence(outcomes=['finished'],
                                  default_outcome='finished',
                                  outcome_map={'finished': {'TURN': 'finished'}}
                                  )
    with cc_room_D:
        smach.Concurrence.add('TURN', Turn(10))

    smach.StateMachine.add('NAVIGATE_ROOM_REGULAR', cc_regular,
                           transitions={'finished':'DO_LOGIC'})
    smach.StateMachine.add('NAVIGATE_ROOM_D', cc_room_D,
                           transitions={'finished':'DO_LOGIC'})

server = RoomCheckServer()

# # if self.preempt_requested():
# #     return 'preempted'