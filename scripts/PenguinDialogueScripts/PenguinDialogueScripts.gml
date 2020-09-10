function penguin_not_wait(){
	change_variable(obj_penguinnpc,"choice_variable",-1)
	with(obj_cutscene){
		cutscene_end_action()
	}
}

function angry_penguin(){
	instance_create_layer(x,y,"Instances",obj_enemy_penguin)
	instance_destroy(obj_penguinnpc)
}