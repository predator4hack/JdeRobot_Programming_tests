#!/usr/bin/env python

import rospy
from geometry_msgs.msg import Twist
from sensor_msgs.msg import LaserScan
from nav_msgs.msg import Odometry
from tf.transformations import euler_from_quaternion
import numpy as np
import math

#Initializing pose
pose = [0,0,0,0,0]

#Function to get distance between two points
def dist(x1,x2,y1,y2):
	return math.sqrt(math.pow(x1-x2,2)+math.pow(y1-y2,2))

def Waypoints(t):
	#Distance to wall before changing cases
	d = 1.5
	#For the first part of the problem statement to trace 2*sin(x)*sin(x/2)
	if t<2*np.pi:
		y = 2*math.sin(t)*math.sin(t/2)
		x = t
		r = dist(pose[0],x,pose[1],y)
		theta = math.atan2(y-pose[1],x-pose[0])
		rospy.loginfo('case 0')
		return [r,theta]
	#For the part 2 of problem statement to Go to Goal with obstacle avoidance
	else:
		#The Goal
		x = 12.5
		y = 0
		#Case 1:Check if there is obstacle between object and goal no obstacles in range so go to goal
		if (int((math.atan2(y-pose[1],x-pose[0])-pose[2])*180/np.pi) in range(-27,28) and regions['front']>d)or(int((math.atan2(y-pose[1],x-pose[0])-pose[2])*180/np.pi) in range(28,83) and regions['fleft']>d)or(int((math.atan2(y-pose[1],x-pose[0])-pose[2])*180/np.pi) in range(83,136) and regions['bleft']>d)or(int((math.atan2(y-pose[1],x-pose[0])-pose[2])*180/np.pi) in range(-28,-83,-1) and regions['fright']>d)or(int((math.atan2(y-pose[1],x-pose[0])-pose[2])*180/np.pi) in range(-83,-136,-1) and regions['bright']>d):
			r = 1
			theta = math.atan2(-1*pose[1],12.5-pose[0])
			rospy.loginfo('case 1')
			return [r,theta]
		# The following cases are for Obstacle avoidance
		#Case 2: Obstacle in Front so turn left
		elif (regions['front'] < d):
			r = 0
			theta = pose[2]+0.5
			rospy.loginfo('case 2')
			#rospy.loginfo(r)
			return [r,theta]
		#Case 3: Keep the Obstacle on the right side and keep bot close enough to the wall
		elif (regions['front'] > d and regions['fleft'] > d and regions['fright'] > d) or (regions['front'] > d and regions['fleft'] < d and regions['fright'] > d) or (regions['front'] > d and regions['fleft'] < d and regions['fright']):
			r = 1
			theta = pose[2]-0.5
			rospy.loginfo('case 3')
			return [r,theta]
		#Case 4: Go straight to follow the Wall
		elif (regions['front'] > d and regions['fleft'] > d and regions['fright'] < d):
			r = 1
			theta = pose[2]
			rospy.loginfo('case 4')
			return [r,theta]
		else:
			rospy.loginfo('unknown case')



# Callback from the Odometry publisher to get the pose of the bot
def odom_callback(data):
	global pose
	x  = data.pose.pose.orientation.x;
	y  = data.pose.pose.orientation.y;
	z = data.pose.pose.orientation.z;

	w = data.pose.pose.orientation.w;
	pose = [data.pose.pose.position.x, data.pose.pose.position.y, euler_from_quaternion([x,y,z,w])[2],data.twist.twist.linear.x,data.twist.twist.angular.z ]

#Callback from laser scan publisher to get the distance from sensors
def laser_callback(msg):
    global regions
    regions = {
        'bright': min(min(msg.ranges[0:143])  ,10) 	,
        'fright': min(min(msg.ranges[144:287]),10)	,
        'front':  min(min(msg.ranges[288:431]),10)	,
        'fleft':  min(min(msg.ranges[432:575]),10)	,
        'bleft':  min(min(msg.ranges[576:719]),10)	,
    }

#Main Loop
def control_loop():

	#Initial setup of subscriber publisher, constant and variable values
	pub = rospy.Publisher('/cmd_vel', Twist, queue_size=10)
	rospy.Subscriber('/ebot/laser/scan', LaserScan, laser_callback)
	rospy.Subscriber('/odom', Odometry, odom_callback)
	Kvp = 1.2
	Kwp = 10
	velocity_msg = Twist()
	t=0.62
	theta=0

	#Initialize node and sleep rate
	rospy.init_node('ebot_controller')
	rate = rospy.Rate(10)

	#Put velocity of the bot as 0 initially
	velocity_msg.linear.x = 0
	velocity_msg.angular.z = 0
	pub.publish(velocity_msg)

	#While loop till the Bot reaches the goal
	while not rospy.is_shutdown():
		#Getting the waypoints
		r,theta = Waypoints(t)
		#Incrementing the parameter for initial path(divided into 10 segments)
		if r<0.2 :
			t = t+0.62

		#Setting and publishing the Velcityt values
		velocity_msg.linear.x = Kvp*r
		velocity_msg.angular.z = Kwp*(theta-pose[2])
		pub.publish(velocity_msg)

		#End the loop if goal is reached
		if dist(12.5,pose[0],0,pose[1])<0.2:
			break

		#Try to keep the loop rate constant of 10Hz
		rate.sleep()

	#Stop the bot after goal is reached
	velocity_msg.linear.x = 0
	velocity_msg.angular.z = 0
	pub.publish(velocity_msg)

if __name__ == '__main__':
	try:
		control_loop()
	except rospy.ROSInterruptException:
		pass
