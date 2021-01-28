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
		room_goto(room_beach_1A)
		global.load_state = load_state.none
	break
	
	case load_state.auto_save:
		//Create list of autosaves for future deleting the most old save
		var ds_saves = ds_list_create()
		var file = file_find_first("Saves\\*",fa_directory)
		while(file != "")
		{
			var is_auto = string_copy(file,0,9)//autosave_
			if is_auto == "autosave_"
			{
				if file_exists("Saves\\"+file+"/playerdata.txt")
				{
					var file_path = "Saves\\"+file+"\\"+"playerdata.txt"
					var file_ = file_text_open_read(file_path)
					var save_string = file_text_read_string(file_)
					file_text_close(file_)
					var save_data = json_decode(save_string)
					var saving_time_ds_list = save_data[? "saving_time"]
									//Day					//Month						//Year					//Hour					//Minute				//Second
					var c_array = [saving_time_ds_list[| 0],saving_time_ds_list[| 1],saving_time_ds_list[| 2],saving_time_ds_list[| 3],saving_time_ds_list[| 4],saving_time_ds_list[| 5]]
					ds_list_add(ds_saves,[file,c_array])
					ds_map_destroy(save_data)
				}
			}
			file = file_find_next();
		}
		file_find_close()
		
		var autosave_name = "autosave_"+string(ds_list_size(ds_saves))
		//Create copy of current save
		file_copy_dir("Saves\\"+global.directory_save,"Saves\\"+autosave_name,fa_directory)
		save_room_data(previous_room,room_data)
		save_game()
		//If autosaves quantity is too big, then delete save 
		if ds_list_size(ds_saves) > global.settings.another.autosaves_limit{
			var Dates
			// Get list of all dates
			for(var i = 0; i < ds_list_size(ds_saves); i++) {
				var save_time = array_get(ds_saves[| i],1)
			    var SaveDate = date_create_datetime(array_get(save_time,2), array_get(save_time,1), array_get(save_time,0), array_get(save_time,3), array_get(save_time,4), array_get(save_time,5));
   
			    Dates[i] = SaveDate;
			}

			// Sort files by dates, in ascending order.
			for(var i = 0; i < ds_list_size(ds_saves); i++) {
			    for(var j = 0; j < ds_list_size(ds_saves) - (i + 1); j++) {
			        if Dates[j] < Dates[j + 1] {
			            var TempVal = ds_saves[| j];
			            ds_saves[| j] = ds_saves[| j + 1];
			            ds_saves[| j + 1] = TempVal;
			            var TempVal = Dates[j];
			            Dates[j] = Dates[j + 1];
			            Dates[j + 1] = TempVal;
			        }
			    }
			}
			//Limit for autosaving, delete the older save.
				var i = 0; while(ds_list_size(ds_saves) > global.settings.another.autosaves_limit){
					var s = "Saves\\"+array_get(ds_saves[| i],0)
					ds_list_delete(ds_saves,i)
					directory_destroy(s)
					show_debug_message("[Save Manager] Save deleted: "+s)
					i++
				}
		}
		//Delete save list
		ds_list_destroy(ds_saves)
		//Load room data string
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





