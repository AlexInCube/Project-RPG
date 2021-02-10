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
			show_debug_message(LOGGER_SAVE_MANAGER+"ERROR WHILE LOADING SAVE FROM SAVES LIST")
			break
		}
		var file = file_text_open_read("Saves\\"+global.directory_save+"/playerdata.txt")
		var save_string = file_text_read_string(file)
		file_text_close(file)
		var save_data = json_parse(save_string)
	
		var save_room = asset_get_index(save_data.player_current_room)
		show_debug_message(LOGGER_SAVE_MANAGER+"Room loading:"+string(room_get_name(save_room)))
		//Story tags
		ds_list_read(story_tags,save_data.story_tags)
		
		global.load_state = load_state.manual_load
		room_goto(save_room)
	break

	case load_state.new_game:
		room_goto(room_beach_1A)
		global.load_state = load_state.none
	break
	
	case load_state.auto_save:
		var ds_saves = ds_list_create()
		var saves_folder = "Saves\\Backups\\"
		var file = file_find_first(saves_folder+"*",fa_directory)
		while(file != "")
		{
			var is_auto = string_copy(file,0,9+string_length(global.directory_save))//autosave_
			if is_auto == "autosave_"+global.directory_save
			{
				if file_exists(saves_folder+file+"/playerdata.txt")
				{
					var file_path = saves_folder+file+"\\"+"playerdata.txt"
					var file_ = file_text_open_read(file_path)
					var save_string = file_text_read_string(file_)
					file_text_close(file_)
					ds_list_add(ds_saves,file)
				}
			}
			file = file_find_next();
		}
		file_find_close()
		
		var autosave_name = "autosave_"+global.directory_save+"_"+string(ds_list_size(ds_saves))
		
		file_copy_dir("Saves\\"+global.directory_save,"Saves\\"+"Backups\\"+autosave_name,fa_directory)
		load_room_data()

		save_room_data(previous_room,room_data)
		save_game()

		//Delete save list
		ds_list_destroy(ds_saves)
		//Load room data string

		global.lastsave = global.directory_save
		write_last_played_save()
		global.load_state = load_state.none
	break
	
	case load_state.test_room:
		room_goto(room_test)
		global.load_state = load_state.none
	break
	
	case load_state.none:
	break
	
}





