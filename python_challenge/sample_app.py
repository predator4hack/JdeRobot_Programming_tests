from typing import Pattern
from game_of_life import GameOfLife
import numpy as np
import time
import json

class configurations:
	# Importing all the configurations
	with open('config.json') as config_file:
			data = json.load(config_file)

	patterns = data['patterns']
	# Still Lifes
	Block = np.array(patterns['Block'])
	Beehive = np.array(patterns['Beehive'])
	Tub = np.array(patterns['Tub'])

	# Oscillators
	Blinker = np.array(patterns['Blinker'])
	Toad = np.array(patterns['Toad'])
	Beacon = np.array(patterns['Beacon'])

	# Spaceships
	Glider = np.array(patterns['Glider'])
	LWSpaceship = np.array(patterns['LWSpaceship'])
	d = {1: Block, 2: Beehive, 3: Tub, 4: Blinker, 5: Toad, 6: Beacon, 7: Glider, 8: LWSpaceship}

if __name__ == '__main__':
	print("\n*********************************************************\n")
	print("\t\tWELCOME TO GAME OF LIFE\n")
	print("*********************************************************")
	g = GameOfLife()
	conf = configurations()

	t = int(input("Please enter the time step value in milliseconds: "))
	t = np.clip(t, 50, 1000)
	max_iterations = int(input("Please enter the maximum number of iterations (int): "))
	max_iterations = np.clip(max_iterations, 10, 1000)

	for _ in range(20):
		print("\nEnter the key to the configuration you want to add :")
		print("\n0 Start Game\t1 Block \n2 Beehive\t3 Tub\n4 Blinker\t5 Toad\n6 Beacon\t7 Glider\n8 Light Space Ship\t9 Random Grid")
		selection = int(input("\nYour Choice: "))
		if selection == 9:
			g.random_grid()
		else:
			i,j = map(int,input("Please enter the location for the pattern as two space-seperated integers: ").split())
			g.add_object(conf.d[selection], i,j)
		
		response = input('\n Do you want to add more configurations? Y/N')
		if response != 'Y' or response != 'y':
			break

	print("Press Ctrl+C at any point to exit. The program shall automatically exit after the maximum iterations.")
	for counter in range(max_iterations):
		g.run_once()
		time.sleep(t/1000)
	g.move_cursor_down()
	print("\n ****************   THANKS FOR PLAYING!  ********************")