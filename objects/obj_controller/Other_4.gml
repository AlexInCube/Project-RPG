//Dont save room data
room_persistent=false
depth=1
//But save player data
if instance_exists(obj_player){
obj_player.persistent=true
}

//Create camera
instance_create_layer(0,0,"Instances",obj_camera)
//global.load_state commented in obj_initcontroller
switch(global.load_state){
	case load_state.manual_load:
		load_game()
	break
	
	case load_state.init_game:
		if !file_exists("Saves\\"+global.directory_save+"/playerdata.txt"){
			exit_to_main_menu()
			show_debug_message("ERROR WHILE LOADING SAVE FROM SAVES LIST")
			break
		}
		var file = file_text_open_read("Saves\\"+global.directory_save+"/playerdata.txt")
		var save_string = file_text_read_string(file)
		file_text_close(file)
		var save_data = json_decode(save_string)
	
		var save_room = asset_get_index(save_data[? "room"])
		show_debug_message("[Game load]"+"Room loading:"+string(save_room))
		ds_map_destroy(save_data)
		global.load_state = load_state.manual_load
		room_goto(save_room)
	break

	case load_state.new_game:
		room_goto(room_player_apartment)
		global.load_state = load_state.none
	break
	
	case load_state.auto_save:
		var autosave_name = "autosave_"+(	
		string(date_get_day(date_current_datetime()))+"_"+
		string(date_get_month(date_current_datetime()))+"_"+
		string(date_get_year(date_current_datetime()))+"_"+
		string(date_get_hour(date_current_datetime()))+"_"+
		string(date_get_minute(date_current_datetime()))+"_"+
		string(date_get_second(date_current_datetime()))
		)
		file_copy_dir("Saves\\"+global.directory_save,"Saves\\"+autosave_name,fa_directory)
		global.directory_save = autosave_name
		load_room_data()
		global.load_state = load_state.none
	break
	
	case load_state.test_room:
		room_goto(room_test)
		global.load_state = load_state.none
	break
	
	case load_state.none:
	break
	
}





