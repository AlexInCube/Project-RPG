/// @description Insert description here
// You can write your code in this editor
randomize()

load_settings()
global.window_list=ds_list_create()//For window system
global.directory_save="rpgsave"

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