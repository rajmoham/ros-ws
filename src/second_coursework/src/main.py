#!/usr/bin/env python3
import actionlib
import rospy
from second_coursework.srv import MoveRobotResponse, MoveRobot
from second_coursework.msg import RoomCheckAction, RoomCheckGoal

def move_to_room_A():
    try:
        rospy.wait_for_service('move_to_room')
        move_robot_srv = rospy.ServiceProxy('move_to_room', MoveRobot)
        move_robot_srv("A")
    except rospy.ServiceException:
        rospy.loginfo("Error")


num_of_checks = rospy.get_param("/ncounts") #Gets the number of checks to do from params
# Initialise node and move the room A
rospy.init_node('main')
move_to_room_A()


# Creating an action client and sending a goal for the number of checks that it will do
room_check_action_client = actionlib.SimpleActionClient('room_check', RoomCheckAction)
room_check_action_client.wait_for_server()
goal = RoomCheckGoal(num_of_checks)
room_check_action_client.send_goal(goal)
room_check_action_client.wait_for_result()
result = room_check_action_client.get_result().rule_break_count

# Printing to the terminal the number of times each rule was broken
rospy.loginfo(f"Rules Broken: Rule 1: {result[0]} times, Rule 2: {result[1]} times")