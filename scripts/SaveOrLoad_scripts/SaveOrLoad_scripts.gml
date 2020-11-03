//Saving working if game paused
function save_game() {
	var save_data = ds_map_create()
	save_data[? "player_x"] = obj_player.phy_position_x
	save_data[? "player_y"] = obj_player.phy_position_y
	save_data[? "player_hp"] = obj_player_stats.hp
	save_data[? "exp"] = obj_player_stats.expr
	save_data[? "lvl"] = obj_player_stats.level
	save_data[? "attribute_points"] = obj_player_stats.attribute_points
	save_data[? "attributes"] = [obj_player_stats.strength,obj_player_stats.energy,obj_player_stats.defense,obj_player_stats.agility]
	save_data[? "room"] = room
	save_data[? "player_inventory"] = ds_grid_write(global.inventory)
	save_data[? "player_equipment"] = ds_grid_write(global.equipment)
	save_data[? "quest_list"] = ds_map_write(global.ds_current_quests)
	save_data[? "saving_time"] = 
	[
	date_get_day(date_current_datetime()),
	date_get_month(date_current_datetime()),
	date_get_year(date_current_datetime()),
	date_get_hour(date_current_datetime()),
	date_get_minute(date_current_datetime())
	]
	save_data[? "game_version"] = GM_version
	var save_string = json_encode(save_data)
	ds_map_destroy(save_data)
	
	//Save Main Data
	var file_path = "Saves\\"+global.directory_save+"\\"+"playerdata.txt"
	var file = file_text_open_write(file_path)
	file_text_write_string(file,save_string)
	file_text_close(file)
	show_debug_message("Main data saved: "+file_path)
	
	
	instance_activate_all()
	show_debug_message(string(instance_exists(obj_trophy_weapon))+"saveable object exists")
	//End of write playerdata.txt
	//Save data about unique objects (trophy, doors and etc...)
	var object_list = ds_list_create()
	with(all){
		//Get tags list
		var asset_tags = asset_get_tags(object_get_name(object_index))
		//Find needed tag "saveable"
		for(var i=0;i<array_length_1d(asset_tags);i++){
			if asset_tags[i] == "saveable"{
				//Create map with variables that we want to save
				var _map = ds_map_create()
				ds_list_add(object_list,_map)
				ds_list_mark_as_map(object_list,ds_list_size(object_list)-1)
				
				//User 14 using only for saving, User 15 only for loading
				CallUserEvent(14,_map)
			}
		}
	}
	
	var wrapper = ds_map_create()
	ds_map_add_list(wrapper,"object_list",object_list)
	
	save_string = json_encode(wrapper);
	
	var file_path = "Saves\\"+global.directory_save+"\\"+string(room_get_name(room))+".txt"
	
	if file_exists(file_path){
		file_delete(file_path)
	}
	
	var file = file_text_open_write(file_path)
	file_text_write_string(file,save_string)
	file_text_close(file)
	ds_map_destroy(wrapper);
	//End of write room_name.txt
	show_debug_message("Room saved: "+file_path)
	show_debug_message("Game saved!")
}
//Game loading working from anywhere
function load_game() {
	instance_activate_all()//This need if we run game loading from pause
	//Find main save file
	var file_path = "Saves\\"+global.directory_save+"\\"+"playerdata.txt"
	var file = file_text_open_read(file_path)
	var save_string = file_text_read_string(file)
	file_text_close(file)
	var save_data = json_decode(save_string)
	//Applying player stats
	with (obj_player_stats){
		expr = save_data[? "exp"]
		level = save_data[? "lvl"]
		max_expr = max_exp_calc(level)
		attribute_points = save_data[? "attribute_points"]
		var _list = save_data[? "attributes"]
		strength = _list[| 0]
		energy = _list[| 1]
		defense = _list[| 2]
		agility = _list[| 3]
		ds_list_destroy(_list)

		hp = save_data[? "player_hp"]
		//hp = clamp(hp,0,max_hp)
	}
	//Applying player coordinates
	if !instance_exists(obj_player){
		instance_create_layer(save_data[? "player_x"],save_data[? "player_y"],"Instances",obj_player)
		}else{
			with(obj_player){
				phy_position_x = save_data[? "player_x"]
				phy_position_y = save_data[? "player_y"]
			}
			
		}
	//Player Inventory
	with(obj_inventory) ds_grid_read(global.inventory,save_data[? "player_inventory"])
	//Player Equipment
	with(obj_inventory){
		ds_grid_read(global.equipment,save_data[? "player_equipment"])
		recalculate_stats(global.equipment)
	}
	//Load quest list and cycle through all list to create quest listeners
	with(obj_questmanager) {
		//Read ds_map
		ds_map_read(global.ds_current_quests,save_data[? "quest_list"])
		//Find first quest_id
		var key = ds_map_find_first(global.ds_current_quests);
		//Create quest listeners
		for(var i=0; i<ds_map_size(global.ds_current_quests); i++){
		var listener = instance_create_depth(0,0,0,obj_questlistener)
		with listener
			{
			quest_id=real(key)
			key = ds_map_find_next(global.ds_current_quests,key)
			//Register quest requirement
			event_user(0)
			}
		}
	}
	
	ds_map_destroy(save_data)
	show_debug_message("Playerdata.txt loaded")
	//End of read playerdata.txt
	
	//Read unique objects data
	file_path = "Saves\\"+global.directory_save+"\\"+string(room_get_name(room))+".txt"
	file = file_text_open_read(file_path)
	var wrapper = json_decode(file_text_read_string(file))
	file_text_close(file)
	var list = wrapper[? "object_list"]
	
	for(var i=0; i<ds_list_size(list);i++){
		var map = list[| i]
		var obj = map[? "obj"]

		with(obj){
			CallUserEvent(15,map)
		}
		
	}
	
	ds_map_destroy(wrapper)
	//End of read room_name.txt
	show_debug_message("Room loaded"+file_path)
}

#region Save/Load Window
//Create save selecting window
function select_slot(){
	menustate = menu_state.window_load_save
	if !instance_exists(obj_save_or_load_window){
		instance_create_depth(0,0,0,obj_save_or_load_window)
	}
}

//Update saves list
function create_saves_map(){
	//Reload Save List
	if ds_exists(ds_saves,ds_type_map){
		ds_map_destroy(ds_saves)
		ds_saves = ds_map_create()
	}else{
		ds_saves = ds_map_create()
	}

    var file = file_find_first("Saves\\*",fa_directory)
	while(file != ""){
		if file_exists("Saves\\"+file+"/playerdata.txt"){
			var file_path = "Saves\\"+file+"\\"+"playerdata.txt"
			var file_ = file_text_open_read(file_path)
			var save_string = file_text_read_string(file_)
			file_text_close(file_)
			var save_data = json_decode(save_string)
			var saving_time_ds_list = save_data[? "saving_time"]
			var c_array = [saving_time_ds_list[| 0],saving_time_ds_list[| 1],saving_time_ds_list[| 2],saving_time_ds_list[| 3],saving_time_ds_list[| 4]]
			
			ds_map_add(ds_saves,file,[c_array,save_data[? "game_version"]])	
			ds_map_destroy(save_data)
		}

		file = file_find_next();
	}
	file_find_close()
	
	ds_size = ds_map_size(ds_saves)
}



#endregion

function write_last_played_save(){
	ini_open("game_settings.ini")
	ini_write_string("Other","lastplayedsave",global.directory_save)
	ini_close()
	global.lastsave = global.directory_save
}

function load_last_player_save(){
	if file_exists("Saves\\"+global.lastsave+"/playerdata.txt"){
		global.directory_save = global.lastsave
		start_load()
	}else{
		show_message("Save not exists: "+"Saves\\"+global.lastsave+"/playerdata.txt")
	}
}