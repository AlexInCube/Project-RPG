//
function game_start() {
	room_goto(room_game_init)
	global.load_state = load_state.new_game
}

function game_exit() {
	write_last_played_save()
	game_end()
}

function open_settings() {
	menustate = menu_state.options
	if !instance_exists(obj_optionswindow){
		instance_create_depth(0,0,0,obj_optionswindow)
	}else{
		instance_destroy(obj_optionswindow)
	}
}