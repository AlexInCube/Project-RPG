event_inherited()
spd = 0.75
image_speed=0.1
state = slime_idle_state
alarm[0] = DELTATIME*irandom_range(120,180)
sight = 128
target = obj_player
targetx = 0
targety = 0
distance_from_spawn = 75

phys_armor = 1
magic_armor = 0
damage = 2
knockback = 50
image_blend = c_red