event_inherited()
spd = 1
image_speed = 1

alarm[0] = irandom_range(120,180)/DELTATIME
sight = 90//If pc detect player
angry_sight = 40//If player too close to pc, pc explode.
targetx = 0
targety = 0

phys_armor = 2
magic_armor = 0
damage = 10
knockback = 0

state = enemy_pc_idle_state