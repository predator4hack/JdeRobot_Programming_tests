# ROS2 Challenge
GSOC 2021

- [Problem Statement](https://drive.google.com/file/d/1IJFTtKVcoVykONS73Mh-EQTpKdXgI-bU/view)
- [demo video](https://youtu.be/krMlsNAyYjA)

### Running the code
- clone the repo
```
cd ROS2_challenge/catkin-ws/devel
source setup.bash
cd ..
```

#### ROS2 is fun exercise
- Running Publisher Node
```
rosrun ros2_is_fun publisher.py
```
- Running Subscriber Node (in another terminal window)
```
rosrun ros2_is_fun subscriber.py
```

- press ctrl+c to abort

#### ROS2 Laser Scan exercise
```
roslaunch turtlebot3_bringup turtlebot3_robot.launch --screen
```

#### ROS2 Navigation Task

#####Task 1.1: Moving the robot in gazebo:
- The objective of the task is to get an overview of gazebo.
- Move the robot in gazebo(not in any particular motion) using the package teleop_twist_keyboard.

#####Task 1.2: Completing Obstacle course Autonomously
There are two main parts to the challenge: (as shown below in the rendered image of the obstacle course)

- First Tracing a Path on Gazebo defined by a function on the x-y plane.

The funtion defining the curve is: 2(sin(x))(sin(x/2)) from x = 0 to 2pi.
[NOTE: The bot is spawned at (0,0) with heading towards +ive x axis]

- Second is to Go To Goal defined as a specific point on the xy plane of Gazebo.

The goal is at (12.5, 0)
But there is an added obstacle in the second task i.e. the Concave Obstacle
This is done by creating a node named, /ebot_controller in a python script named, controller.py

that will subscribe to

* nav_msgs/Odometry data from /odom topic and
* range data from /ebot/laser/scan topics.
execute the necessary logic and controller to complete the challenge

and publish geometry_msgs/Twist to /cmd_vel
[ROS Navigation](https://portal.e-yantra.org/storage/NgNcFAYaXY_sb/res/eyrc_SB/task1/media/task1-arena-render.JPG)

- Launch Gazebo enviornment
```
roslaunch ebot_description task1.launch
```
- Launch the controller node
```
rosrun ebot_controller controller.py
```
