function save_game() {
	unpause_game()
	var save_data = ds_map_create()
	save_data[? "player_x"] = obj_player.phy_position_x
	save_data[? "player_y"] = obj_player.phy_position_y
	save_data[? "player_hp"] = obj_player_stats.hp
	save_data[? "room"] = room
	save_data[? "player_inventory"] = ds_grid_write(global.inventory)
	save_data[? "player_equipment"] = ds_grid_write(global.equimpent)
	save_data[? "quest_list"] = ds_grid_write(obj_questmanager.ds_quests)
	
	var save_string = json_encode(save_data)
	ds_map_destroy(save_data)
	
	var file = file_text_open_write("rpgsave.txt")
	file_text_write_string(file,save_string)
	file_text_close(file)
	show_debug_message("Game Saved!")
}

function load_game() {
	instance_activate_all()
	var file = file_text_open_read("rpgsave.txt")
	var save_string = file_text_read_string(file)
	file_text_close(file)
	var save_data = json_decode(save_string)
	
	var save_room = save_data[? "room"]
	room_goto(save_room)
	show_debug_message("[Game load]"+"Room loading:"+string(save_room))
	
	
	
	if !instance_exists(obj_player_stats){
		instance_create_depth(0,0,0,obj_player_stats)
	}
	if !instance_exists(obj_inventory){
		instance_create_depth(0,0,0,obj_inventory)
	}
	if !instance_exists(obj_questmanager){
		instance_create_depth(0,0,0,obj_questmanager)
	}

	
	with (obj_player_stats){
		hp = save_data[? "player_hp"]
		hp = clamp(hp,0,max_hp)
		
		if !instance_exists(obj_player){
		instance_create_layer(save_data[? "player_x"],save_data[? "player_y"],"Instances",obj_player)
		show_debug_message("[Game load]"+"Player created!")
		}else{
			with(obj_player){
				phy_position_x = save_data[? "player_x"]
				phy_position_y = save_data[? "player_y"]
			}
			show_debug_message("[Game load]"+"PlayerX:"+string(obj_player.phy_position_x)+"PlayerY:"+string(obj_player.phy_position_y))
		}
	}
	
	with(obj_inventory) ds_grid_read(global.inventory,save_data[? "player_inventory"])
	with(obj_inventory) ds_grid_read(global.equimpent,save_data[? "player_equipment"])
	with(obj_questmanager) ds_grid_read(ds_quests,save_data[? "quest_list"])
}

function unpause_game(){
	instance_destroy()
	audio_resume_all()
}

function exit_to_main_menu(){
	//Exit to main menu
	instance_activate_all()
	room_persistent = false
	instance_destroy()
	with(obj_controller.inventorywindow)instance_destroy()
	with(obj_controller.equipmentwindow)instance_destroy()
	with(obj_controller.questlistwindow)instance_destroy()
	with(obj_controller)instance_destroy()
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
	ds_grid_clear(global.eventMap,0)
	
	audio_stop_all()
	room_goto(room_main)
	
}