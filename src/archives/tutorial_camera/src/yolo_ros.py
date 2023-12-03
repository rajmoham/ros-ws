#!/usr/bin/env python3
# coding=utf-8

import rospy

class YOLOv4ROS:
    def __init__(self):
        pass

    def img_callback(self, msg):
        pass

    def yolo_service(self, request):
        pass

    if __name__ == "__main__":
        rospy.init_node('yolo_ros_itr')
        yolo_ros = YOLOv4ROS()
        rospy.spin()