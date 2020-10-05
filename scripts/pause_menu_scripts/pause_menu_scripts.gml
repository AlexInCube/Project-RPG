//Init game (create inventory, controllers and etc.) 
function start_load(){
	clear_app()
	global.load_state = load_state.init_game
	room_goto(room_game_init)
}

//Destroy obj_pause and resume game
function resume_game(){
	show_debug_message("Game resumed!")
	with(obj_pause)instance_destroy()
	instance_activate_all()
	audio_resume_all()
}

function fast_save_game(){
	instance_activate_all()
	with(obj_pause)alarm[1]=1
}

//Exit to main menu from pause
function exit_to_main_menu(){
	//Exit to main menu
	clear_app()
	audio_stop_all()
	room_goto(room_main)
}

//Destroy anything saveable things in game 
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