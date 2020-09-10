/// @description Insert description here
// You can write your code in this editor
event_inherited()
spd = 1.5
image_speed = 0.2
state = enemy_idle_state_chinlin
alarm[0] = room_speed*irandom_range(2,3)
sight = 64
xaxis = 0
yaxis = 0
movement = IDLE
face = RIGHT

sprite[RIGHT,MOVE] = spr_chinlin_run_right
sprite[UP,MOVE] = spr_chinlin_run_up
sprite[LEFT,MOVE] = spr_chinlin_run_right
sprite[DOWN,MOVE] = spr_chinlin_run_down

sprite[RIGHT,IDLE] = spr_chinlin_stand_right
sprite[UP,IDLE] = spr_chinlin_stand_up
sprite[LEFT,IDLE] = spr_chinlin_stand_right
sprite[DOWN,IDLE] = spr_chinlin_stand_down

phys_armor=2
magic_armor=0