#!/usr/bin/env python

import rospy
from ros2_is_fun.msg import my_message

import random


def main():
    
    # 1. Create a handle to publish messages to a topic.
    var_handle_pub = rospy.Publisher('my_topic', my_message, queue_size=10)
    
    # 2. Initializes the ROS node for the process.
    rospy.init_node('publisher_node', anonymous=True)

    # 3. Set the Loop Rate 
    var_loop_rate = rospy.Rate(1) # 1 Hz : Loop will its best to run 1 time in 1 second
    
    # 4. Write the infinite Loop
    while not rospy.is_shutdown():
        obj_msg = my_message()

        obj_msg.message = "Hello! ROS2 is Fun"

        rospy.loginfo("Publishing: ")
        rospy.loginfo(obj_msg)

        var_handle_pub.publish(obj_msg)

        var_loop_rate.sleep()



# Python Main
if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        pass
