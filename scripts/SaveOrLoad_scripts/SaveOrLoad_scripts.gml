//Saving working if game paused
function save_game() {
	unpause_game()//Unpause game for saving (activate all instances)
	
	var save_data = ds_map_create()
	save_data[? "player_x"] = obj_player.phy_position_x
	save_data[? "player_y"] = obj_player.phy_position_y
	save_data[? "player_hp"] = obj_player_stats.hp
	save_data[? "room"] = room
	save_data[? "player_inventory"] = ds_grid_write(global.inventory)
	save_data[? "player_equipment"] = ds_grid_write(global.equipment)
	save_data[? "quest_list"] = ds_map_write(global.ds_current_quests)
	
	var save_string = json_encode(save_data)
	ds_map_destroy(save_data)
	
	var file_path = "Saves\\"+global.directory_save+"\\"+"playerdata.txt"
	var file = file_text_open_write(file_path)
	file_text_write_string(file,save_string)
	file_text_close(file)
	show_debug_message("Game Saved: "+file_path)
}
//Game loading working from anywhere
function load_game() {
	instance_activate_all()
	var file_path = "Saves\\"+global.directory_save+"\\"+"playerdata.txt"
	var file = file_text_open_read(file_path)
	var save_string = file_text_read_string(file)
	file_text_close(file)
	var save_data = json_decode(save_string)

	with (obj_player_stats){
		hp = save_data[? "player_hp"]
		hp = clamp(hp,0,max_hp)
	}
	
	if !instance_exists(obj_player){
		instance_create_layer(save_data[? "player_x"],save_data[? "player_y"],"Instances",obj_player)
		show_debug_message("[Game load]"+"Player created!")
		}else{
			with(obj_player){
				phy_position_x = save_data[? "player_x"]
				phy_position_y = save_data[? "player_y"]
			}
			
		}
	
	with(obj_inventory) ds_grid_read(global.inventory,save_data[? "player_inventory"])
	with(obj_inventory) ds_grid_read(global.equipment,save_data[? "player_equipment"])
	with(obj_questmanager) {
		ds_map_read(global.ds_current_quests,save_data[? "quest_list"])
		var key = ds_map_find_first(global.ds_current_quests);
		for(var i=0; i<ds_map_size(global.ds_current_quests); i++){
		var listener = instance_create_depth(0,0,0,obj_questlistener)
		with listener
			{
			quest_id=real(key)
			key = ds_map_find_next(global.ds_current_quests,key)
			event_user(0)
			}
		}
	}
	show_debug_message("[Game load]"+"PlayerX:"+string(obj_player.phy_position_x)+"PlayerY:"+string(obj_player.phy_position_y))
	
	ds_map_destroy(save_data)
}

//Create save selecting window
function select_slot(){
	menustate = menu_state.window_load_save
	if !instance_exists(obj_save_or_load_window){
		instance_create_depth(0,0,0,obj_save_or_load_window)
	}
}

function create_saves_list(){
	//Reload Save List
	if ds_exists(ds_saves,ds_type_list){
		ds_list_destroy(ds_saves)
		ds_saves = ds_list_create()
	}else{
		ds_saves = ds_list_create()
	}

	var file = file_find_first("Saves\\*",fa_directory)
	while(file != ""){
		if file_exists("Saves\\"+file+"/playerdata.txt"){
			ds_list_add(ds_saves,file)	
		}

		file = file_find_next();
	}
	file_find_close()
	
	ds_size = ds_list_size(ds_saves)
}
