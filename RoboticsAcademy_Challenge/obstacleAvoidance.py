from numpy.lib.shape_base import dsplit
from GUI import GUI
from HAL import HAL
import math
import numpy as np
# Enter sequential code!
threshold_angle = 0.01
threshold_distance = 0.05
kp = 1.0
prev = 0

while True:
    # Enter iterative code!
    # creating Objects
    currentTarget = GUI.map.getNextTarget()
    laser_data = HAL.getLaserData ()

    # definging Variables
    pos = [HAL.getPose3d().x, HAL.getPose3d().y]
    dist = [-1*(currentTarget.getPose().x - pos[0]), -1*(currentTarget.getPose().y - pos[1])]
    mod_dist = math.sqrt(dist[0]**2 + dist[1]**2)

    GUI.map.targetx = currentTarget.getPose().x
    GUI.map.targety = currentTarget.getPose().y
    if (dist[1] <= 0.001):
        currentTarget.setReached(True)
    GUI.map.carx = 1.5*(dist[0] / mod_dist)
    GUI.map.cary = 1.5*(dist[1] / mod_dist)
    GUI.map.obsx = 0.0
    GUI.map.obsy = 0.0

    # Getting Laser data
    laser_vect = [[0, 0]]
    for a in range(len(laser_data.values)):
        d = laser_data.values[a]
        if d <= threshold_distance:
            x = d*math.cos(math.radians(a))
            y = d*math.sin(math.radians(a))
            v = np.array([x, y])
            laser_vect.append(v)
    laser_vect = np.array(laser_vect)
    obstacle_vect = np.mean(laser_vect, axis=0) # Net obstacle vector

    obstacle_vect[0] = 80*(obstacle_vect[1] - prev)
    prev = obstacle_vect[1]
    GUI.map.obsx = -1*obstacle_vect[0]

    avgx = dist[0]/mod_dist - obstacle_vect[0]
    avgy = dist[1]/mod_dist
    GUI.map.avgx = avgx
    GUI.map.avgy = avgy

    angle = 0
    if(avgy != 0):
        angle = -1*math.atan(avgx/ avgy)
    else:
        if (avgx > 0):
            angle = -1.57
        else:
            angle = 1.57

    if(abs(angle) < threshold_angle):
        angle = 0

    HAL.motors.sendW(kp*angle)
    #HAL.motors.sendW(-0.1)
    HAL.motors.sendV(2.0)

    console.print(str(angle) + "      " + str(obstacle_vect[0]))