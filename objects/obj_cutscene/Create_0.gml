//put action array in obj_cutscene_trigger in value t_scene_info, in creation code room editor 


scene_info = 1//Array copy from obj_cutscene_trigger
scene = 0//Current playable action

//Timer for cutscene_wait
timer = 0

//Where we want character go (cutscene_move_character)
x_dest = -1
y_dest = -1

if instance_exists(obj_camera){
	obj_camera.manual_control = false
}

