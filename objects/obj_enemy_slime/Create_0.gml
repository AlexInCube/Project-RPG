/// @description Insert description here
// You can write your code in this editor
event_inherited()
spd = 0.75
image_speed=0.1
state = scr_enemy_idle_state
alarm[0] = room_speed*irandom_range(2,3)
sight = 64
targetx = 0
targety = 0

phys_armor=1
magic_armor=0