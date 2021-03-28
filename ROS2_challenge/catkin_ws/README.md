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
- Launch Gazebo enviornment
```
roslaunch ebot_description task1.launch
```
- Launch the controller node
```
rosrun ebot_controller controller.py
```