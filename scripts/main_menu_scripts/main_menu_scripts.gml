function scr_game_start() {
	room_goto_next()
}

function scr_continue_game() {
	show_message("This lie! The game cannot be continued, as cannot be saved.")
}

function scr_game_exit() {
	game_end()
}

function scr_open_settings() {
	if !instance_exists(obj_optionswindow){
		var xx=(GUIWIDTH/2)-450/2
		var yy=(GUIHEIGHT/2)-300/2
		var window = instance_create_depth(xx,yy,0,obj_optionswindow)
		window.window_x=xx
		window.window_y=yy
		window.xx=xx
		window.yy=yy
	}else{
		instance_destroy(obj_optionswindow)
	}
}

function unpause_game(){
	instance_destroy()
	audio_resume_all()
}

function exit_to_main_menu(){
	//Exit to main menu
	instance_activate_all()
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
	obj_player_stats.persistent=false
	obj_inventory.persistent=false
	
	obj_questmanager.persistent=false
	ds_grid_destroy(obj_questmanager.ds_quests)
	with(obj_questmanager)instance_destroy()
	with(obj_questlistener)instance_destroy()
	ds_grid_clear(global.eventMap,0)
	ds_grid_destroy(global.inventory)
	ds_grid_destroy(global.armor_equipped)
	ds_grid_destroy(global.crafting_inventory)
	ds_grid_destroy(global.mouse_slot)
	audio_stop_all()
	room_goto(room_main)
	
}