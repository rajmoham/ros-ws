#!/usr/bin/env python3

import rospy
from geometry_msgs.msg import Twist
from math import pi

rospy.init_node('circle_node',anonymous=True)
velocity_pub = rospy.Publisher('/turtle1/cmd_vel',Twist,queue_size=10)

naptime = rospy.Rate(10)

turning = False
counter = 0

vel_mes = Twist()


while not rospy.is_shutdown():
    if (turning):
        vel_mes.angular.z = pi / 2
        vel_mes.linear.x = 0
        counter += 1
        if (counter == 10):
            counter = 0
            turning = False
    else:
        vel_mes.angular.z = 0
        vel_mes.linear.x = 2
        counter += 1
        if (counter == 10):
            counter = 0
            turning = True

    velocity_pub.publish(vel_mes)
    naptime.sleep()