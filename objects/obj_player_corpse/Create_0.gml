change_camera_mode(camera_mode.move_to_follow_object,id,0.1)
with(obj_weapon_controller)instance_destroy()
depth = -15000
fade = 0
fading = false
alarm[0] = 60/DELTATIME
alarm[1] = 180/DELTATIME
visible = 1
killer=""