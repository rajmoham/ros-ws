#!/usr/bin/env python3

import rospy
from geometry_msgs.msg import Twist
from math import pi

rospy.init_node('circle_node',anonymous=True)
velocity_pub = rospy.Publisher('/turtle1/cmd_vel',Twist,queue_size=10)

naptime = rospy.Rate(10)

vel_mes = Twist()
vel_mes.linear.x = 2
vel_mes.angular.z= pi/2

while not rospy.is_shutdown():

        velocity_pub.publish(vel_mes)

        naptime.sleep()