//Init game (create inventory, controllers and etc.) 
function start_load(){
	clear_app()//Reset game state
	global.load_state = load_state.init_game
	room_goto(room_game_init)
}
function pause_game(){
	if obj_gui_screen_controller.active_screen{close_screen() exit}
	with instance_create_layer(0,0,"Controllers",obj_pause){
		//Set background for pause
		background = surface_create(GUIWIDTH,GUIHEIGHT)
		surface_set_target(background)
		//Set blur
		var uni_time = shader_get_uniform(shd_bright_contrast,"time");
		var var_time_var = 0;

		var uni_mouse_pos = shader_get_uniform(shd_bright_contrast,"mouse_pos");
		var var_mouse_pos_x = mouse_x - camera_get_view_x(0);
		var var_mouse_pos_y = mouse_y - camera_get_view_y(0);

		var uni_resolution = shader_get_uniform(shd_bright_contrast,"resolution");
		var var_resolution_x = camera_get_view_width(0);
		var var_resolution_y = camera_get_view_height(0);

		var uni_brightness_amount = shader_get_uniform(shd_bright_contrast,"brightness_amount");
		var var_brightness_amount = 0;

		var uni_contrast_amount = shader_get_uniform(shd_bright_contrast,"contrast_amount");
		var var_contrast_amount = -0.50;
		shader_set(shd_bright_contrast);
	    shader_set_uniform_f(uni_time, var_time_var);
	    shader_set_uniform_f(uni_mouse_pos, var_mouse_pos_x, var_mouse_pos_y);
	    shader_set_uniform_f(uni_resolution, var_resolution_x, var_resolution_y);
	    shader_set_uniform_f(uni_brightness_amount, var_brightness_amount);
	    shader_set_uniform_f(uni_contrast_amount, var_contrast_amount );
		
		draw_surface(application_surface,0,0)
		shader_reset()
		surface_reset_target()
	}
}

//Destroy obj_pause and resume game
function resume_game(){
	console_log("Game resumed!")
	with(obj_pause)instance_destroy()
	instance_activate_all()
	with(obj_camera)event_user(0)
	audio_resume_all()
	io_clear()
}

//Exit to main menu from pause
function exit_to_main_menu(){
	//Exit to main menu
	clear_app()
	audio_stop_all()
	write_last_played_save()
	room_goto(room_main)
}

//Destroy any saveable things in game 
function clear_app(){
	instance_activate_all()
	room_persistent = false
	instance_destroy()
	destroy_all_windows()
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
	with(obj_gui_screen_controller)instance_destroy()
	ds_map_clear(global.eventMap)
	
	var ds_pos = ds_map_find_first(global.story_tags)
	for(var i = 0; i<ds_map_size(global.story_tags);i++){
		global.story_tags[? ds_pos] = false
		ds_pos = ds_map_find_next(global.story_tags,ds_pos)
	}
	audio_stop_all()
}