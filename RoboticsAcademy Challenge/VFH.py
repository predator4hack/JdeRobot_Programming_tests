from GUI import GUI
from HAL import HAL
import math
import numpy as np
# Enter sequential code!
threshold_angle = 0.01
threshold_distance = 0.25
threshold = 0.01
kp = 1.0

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

    # Creating the Histogram
    hist = []
    for a in range(len(laser_data.values)):
        d = laser_data.values[a]
        if d < threshold_distance:
            hist.append(threshold_distance - d)
    
    # Smoothening the histogram
    for i, j in enumerate(hist):
        if(i>0 and i<len(hist)-1):
            hist[i] = (hist[i-1] + hist[i] + hist[i+1])/3.0
            if hist[i] < threshold:
                hist[i] = 0.0

    h = 0
    l_min = -1
    l_max = -1
    g_min = -1
    g_max = -1
    global_count = 0
    while h < len(hist):
        count = 0
        if hist[h] == 0 :
            l_min = h
            while  h < len(hist) and hist[h] == 0:
                count += 1
                h += 1
                l_max = h
        if count > global_count:
            global_count = count
            g_min = l_min
            g_max = l_max
        h += 1

    obstacle_vect = np.zeros((2,2), dtype=float)

    dir = 0
    if g_min != -1 and g_max!= -1:
        dir = int((g_max + g_min)/2.0)
        obstacle_vect[0] = math.cos(math.radians(dir))
        obstacle_vect[1] = math.sin(math.radians(dir))
    else:
        HAL.motors.sendV(0.0)
        HAL.motors.sendW(0.0)
        break

    GUI.map.obsx = obstacle_vect[0]

    avgx = dist[0]/mod_dist + obstacle_vect[0]
    avgy = dist[1]/mod_dist + obstacle_vect[1]
    GUI.map.avgx = avgx
    GUI.map.avgy = avgy

    # angle = 0
    # if(avgy != 0):
    #     angle = -1*math.atan(avgx/ avgy)
    # else:
    #     if (avgx > 0):
    #         angle = -1.57
    #     else:
    #         angle = 1.57
    angle = -1 * math.radians(dir)

    if(abs(angle) < threshold_angle):
        angle = 0

    HAL.motors.sendW(kp*angle)
    #HAL.motors.sendW(-0.1)
    HAL.motors.sendV(2.0)

    console.print(str(angle) + "      " + str(obstacle_vect[0]))