#!/usr/bin/env python3
import os
import rospy
from first_coursework.msg import Command

file_reader = open(os.getenv("HOME") + "/command_list.txt", 'r')
commands = file_reader.readlines()
file_reader.close()

num_of_commands = len(commands)
rospy.init_node('command_generator', anonymous=True)
cmd_pub = rospy.Publisher('navigation_command', Command, queue_size=10)
nap_time = rospy.Rate(5)

msg = Command()

for cmd in commands:
    mnt, value = cmd.split(" ")
    value = int(value[:-1])
    if (mnt == "forward" or mnt == "backward") and (value < 0):
        continue

    msg.command = mnt
    msg.value = value
    nap_time.sleep()
    cmd_pub.publish(msg)
