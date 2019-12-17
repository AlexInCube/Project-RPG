/// @description Insert description here
// You can write your code in this editor
event_inherited()
spd = 0.75
image_speed=room_speed/8
state = scr_enemy_idle_state
alarm[0] = room_speed*irandom_range(2,3)
sight = 64
targetx = 0
targety = 0

physarmor=1
magicarmor=1