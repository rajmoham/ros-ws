#!/usr/bin/env python3

# imports
import math
import rospy
from geometry_msgs.msg import Twist
from first_coursework.msg import Command
from math import pi
from enum import Enum

# enums for turtle's status
class status(Enum):
    forward = 1
    backward = 2
    turning = 3
    none = 4

# class for queue data structure containing commands
class customQueue:
    q = []

    def add_command(self, comm):
        self.q.append(comm)

    def next_command(self):
        next_comm = self.q[0]
        self.q = self.q[1:]
        return next_comm

    def length(self):
        return len(self.q)

command_queue = customQueue()
vel_msg = Twist()

# callback function for the navigation_command node
def navCallback(data):
    command_queue.add_command(data)

# Defining rospy node, subscribing to publisher and publishing to turtlesim
rospy.init_node('navigation_node', anonymous=True)
turtle_pub = rospy.Publisher('/turtle1/cmd_vel', Twist, queue_size=10)
rospy.Subscriber('navigation_command', Command, navCallback)

# defining variables used in while loop
freq = 5
nap_time = rospy.Rate(freq)
curr_status = status.none
curr_command = None

MAX_SPD = 2
MAX_ANG_SPD = pi/2

# PD controller function which outputs the angular/linear speed of turtle from set of parameters
def PD_gain(target_value, current_value, curr_speed, max_val):
    k_p = 2
    k_d = 0.75

    error = target_value - current_value
    derivative_part = -curr_speed # Derivative of change of error / time

    gain = k_p * error + k_d * derivative_part

    # Fine-tuning output for better results/meeting coursework conditions
    if gain > max_val:
        gain = max_val

    if gain > error:
        gain = error

    min_val = max_val / 20
    if gain < min_val:
        gain = min_val

    return gain

target_val = 0
curr_value = 0
spd = 0

# Main loop where turtle motion is controlled
while not rospy.is_shutdown():
    # Check for commands when turtle is doing nothing
    if curr_status == status.none and not command_queue.length() == 0:
        curr_command = command_queue.next_command()
        t1 = rospy.Time.now().to_sec()
        if curr_command.command == "forward":
            target_val = curr_command.value
            curr_status = status.forward
            spd = PD_gain(target_val, 0, 2, MAX_SPD)
            vel_msg.linear.x = spd
        elif curr_command.command == "backward":
            target_val = curr_command.value
            curr_status = status.backward
            spd = PD_gain(target_val, 0, 2, MAX_SPD)
            vel_msg.linear.x = -spd
        elif curr_command.command == "turn":
            target_val = math.radians(curr_command.value)
            curr_status = status.turning
            spd = PD_gain(target_val, 0, pi/2, MAX_ANG_SPD)
            if target_val < 0:
                vel_msg.angular.z = -spd
            else:
                vel_msg.angular.z = spd

    elif curr_status == status.turning:
        curr_value += spd * 1/freq
        spd = PD_gain(abs(target_val), curr_value, spd, MAX_ANG_SPD)

        if target_val < 0:
            vel_msg.angular.z = -spd
        else:
            vel_msg.angular.z = spd

        if abs(target_val) <= curr_value:
            vel_msg.angular.z = 0
            curr_value = 0
            curr_status = status.none

    elif curr_status == status.forward or curr_status == status.backward:
        curr_value += spd * 1/freq
        spd = PD_gain(target_val, curr_value, spd, MAX_SPD)

        if curr_status == status.forward:
            vel_msg.linear.x = spd
        else:
            vel_msg.linear.x = -spd

        if target_val <= curr_value:
            vel_msg.linear.x = 0
            curr_value = 0
            curr_status = status.none

    turtle_pub.publish(vel_msg)
    nap_time.sleep()