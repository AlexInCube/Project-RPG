/// @description One-time object, calling only if game start.
randomize()

setup_default_settings()//Setup default settings
load_settings()//Load volume, controlls and other settings

game_set_speed(global.settings.video.game_speed, gamespeed_fps);


global.window_list=ds_list_create()//For window system
if file_exists("misc.ini"){
ini_open("misc.ini")
	global.lastsave = ini_read_string("saves","lastsave","")
ini_close()
global.directory_save=global.lastsave//Current saving for loading
}else{
global.directory_save="rpgsave"//Current saving for loading
global.lastsave=""
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