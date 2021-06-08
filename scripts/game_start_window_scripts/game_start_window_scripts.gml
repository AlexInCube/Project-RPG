function open_game_start_window(){
	if !instance_exists(obj_game_start_window){
		with(instance_create_layer(0,0,"Instances",obj_game_start_window)){
			window_x = GUIWIDTH/2 - window_width/2
			window_y = GUIHEIGHT/2 - window_height/2
			event_user(0)
		}
	}
}

