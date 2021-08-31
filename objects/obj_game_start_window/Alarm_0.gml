if file_exists("Saves\\"+obj_ui_textbox.txt){
		file_delete("Saves\\"+obj_ui_textbox.txt)
	}
	global.directory_save = obj_ui_textbox.txt

	with(obj_game_start_window){
		instance_destroy()
	}	
	room_goto(room_game_init)
	global.load_state = load_state.new_game