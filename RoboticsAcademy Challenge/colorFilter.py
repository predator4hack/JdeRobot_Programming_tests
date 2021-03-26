from GUI import GUI
from HAL import HAL
# Enter sequential code!
import cv2
import numpy as np

while True:
    frame = HAL.getImage()
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    blur = cv2.GaussianBlur(gray, (30, 30), 0)
    
    #Otsu's Thresholding
    ret, th = cv2.threshold(blur, 0, 255,cv2.THRESH_BINARY+cv2.THRESH_OTSU)
    
    #Adaptive Gaussian Thresholding
    th1 = cv2.adaptiveThreshold(gray,255,cv2.ADAPTIVE_THRESH_GAUSSIAN_C,\
            cv2.THRESH_BINARY,11,2)
            
    hsv = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)
    blue_lower = np.array([0, 120, 97], dtype='uint8')
    blue_upper = np.array([179, 255, 255], dtype='uint8')
    
    mask = cv2.inRange(hsv, blue_lower, blue_upper)
    erosion = cv2.erode(mask, kernel, iterations=2)
    dialation = cv2.dialate(erosion, kernel, iterations=2)
    
    cont = cv2.findContours(dialation, cv2.RETR_LIST, cv2.cv2.CHAIN_APPROX_SIMPLE)
    
    areas = [cv2.contourArea(c) for c in cont]
    
    if len(areas) > 0:
        area_max = np.argmax(areas)
        (x, y), radius = cv2.minEnclosingCircle(cont[area_max])
        radius = int(radius)
        
        center = (int(x), int(y))
        cv2.circle(frame, center, radius, (0, 255, 255), 2)
            
    GUI.showImage(th1)
        