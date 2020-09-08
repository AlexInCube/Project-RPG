function save_game() {
	unpause_game()
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


function start_load(){
	clear_app()
	global.load_state = load_state.init_game
	room_goto(room_game_init)
}

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
	

function unpause_game(){
	instance_destroy()
	audio_resume_all()
}

function exit_to_main_menu(){
	//Exit to main menu
	clear_app()
	audio_stop_all()
	room_goto(room_main)
}


function clear_app(){
	instance_activate_all()
	room_persistent = false
	instance_destroy()
	if instance_exists(obj_controller){
	with(obj_controller.inventorywindow)instance_destroy()
	with(obj_controller.equipmentwindow)instance_destroy()
	with(obj_controller.questlistwindow)instance_destroy()
	with(obj_controller)instance_destroy()
	}
	with(obj_camera)instance_destroy()
	if instance_exists(obj_player){
		obj_player.persistent=false
	}
	if instance_exists(obj_weapon_controller){
		obj_weapon_controller.persistent=false
	}
	with(obj_player_stats)instance_destroy()
	with(obj_inventory)instance_destroy()
	with(obj_questmanager)instance_destroy()
	with(obj_questlistener)instance_destroy()
	
	audio_stop_all()
}