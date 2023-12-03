#!/usr/bin/env python3
import math

import rospy
import actionlib
from second_coursework.srv import MoveRobotRequest, MoveRobot
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
from actionlib_msgs.msg import GoalStatus

room_position = {
    # 'Room' : (x-pos, y-pos)
    "A" : [2.00, 8.66],
    "B" : [6.00, 8.35],
    "D" : [2.00, 2.50]
}

goal = MoveBaseGoal()

def move_base_setup():
    goal.target_pose.header.stamp = rospy.get_rostime()
    goal.target_pose.header.frame_id = 'map'
    goal.target_pose.pose.position.z = 0
    goal.target_pose.pose.orientation.x = 0
    goal.target_pose.pose.orientation.y = 0
    goal.target_pose.pose.orientation.z = math.sin(-math.pi / 4)
    goal.target_pose.pose.orientation.w = math.cos(-math.pi / 4)
    
def set_room(req: MoveRobotRequest):
    room = req.room
    rospy.loginfo('Callback: Moving to Room ' + req.room)
    x_pos, y_pos = room_position[room]

    move_base_setup()

    goal.target_pose.pose.position.x = x_pos
    goal.target_pose.pose.position.y = y_pos

    move_base_client.send_goal(goal)
    move_base_client.wait_for_result()

    status = move_base_client.get_state()

    return status == GoalStatus.SUCCEEDED

rospy.init_node('move_robot')
rospy.loginfo('Starting Move Robot Service')
move_base_client = actionlib.SimpleActionClient('move_base', MoveBaseAction)
move_base_client.wait_for_server()
rospy.Service('move_to_room', MoveRobot, set_room)
rospy.spin()