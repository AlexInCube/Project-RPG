/// @description One-time object, calling only if game start.
randomize()

setup_default_settings()//Load volume, controlls and other settings
load_settings()

global.window_list=ds_list_create()//For window system
if file_exists("Saves\\"+global.settings.lastsave+"/playerdata.txt"){
global.directory_save=global.settings.lastsave//Current saving for loading
}else{
global.directory_save="rpgsave"//Current saving for loading
}

if !directory_exists("Saves"){
	directory_create("Saves")
}

draw_set_font(fnt_small)
alarm[0]=1

GUIWIDTH=display_get_gui_width()
GUIHEIGHT=display_get_gui_height()

//For save/load system
enum load_state{
	none,
	new_game,//Init controllers (obj_controller, obj_inventory and etc...)
	init_game,//Same as new_game, but prepare save to load.
	manual_load//Load save after they prepared by init_game
}

global.load_state = load_state.none

