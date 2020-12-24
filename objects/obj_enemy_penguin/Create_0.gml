

event_inherited()
spd = 1.5
image_speed = 0.2
state = enemy_idle_state_chinlin
alarm[0] = DELTATIME*irandom_range(2,3)
sight = 300
xaxis = 0
yaxis = 0
movement = IDLE
face = RIGHT
max_hp = 25
hp = max_hp

sprite[RIGHT,MOVE] = spr_penguin_right
sprite[UP,MOVE] = spr_penguin_up
sprite[LEFT,MOVE] = spr_penguin_left
sprite[DOWN,MOVE] = spr_penguin_down

sprite[RIGHT,IDLE] = spr_penguin_right
sprite[UP,IDLE] = spr_penguin_up
sprite[LEFT,IDLE] = spr_penguin_left
sprite[DOWN,IDLE] = spr_penguin_down

phys_armor=2
magic_armor=0