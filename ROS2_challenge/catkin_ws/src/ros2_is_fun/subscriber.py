#!/usr/bin/env python

import rospy
from ros2_is_fun.msg import my_message


def func_callback_topic_my_topic(myMsg):

    rospy.loginfo("Data Received: %s", myMsg.message)


def main():

    # 1. Initialize the Subscriber Node.
    rospy.init_node('subscriber_node', anonymous=True)

    # 2. Subscribe to the desired topic and attach a Callback Funtion to it.
    rospy.Subscriber("my_topic", my_message, func_callback_topic_my_topic)

    # 3. spin() simply keeps python from exiting until this node is stopped
    rospy.spin()


# Python Main
if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        pass