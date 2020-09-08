function select_slot(){
	if !instance_exists(obj_save_or_load_window){
		instance_create_depth(0,0,0,obj_save_or_load_window)
	}
}

function game_start() {
	room_goto(room_game_init)
	global.load_state = load_state.new_game
}

function game_exit() {
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