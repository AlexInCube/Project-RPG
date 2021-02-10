//
function game_start() {
	global.directory_save = get_string(find_keyword("write_your_save_name"),"YourSave")
	room_goto(room_game_init)
	global.load_state = load_state.new_game
}

function test_room_start() {
	room_goto(room_game_init)
	global.load_state = load_state.test_room
}

function show_exit_question(){
	open_question_window(450,150,"are_you_sure","i_am_weak","i_am_not_surrender",game_exit,instance_destroy)
}

function game_exit() {
	write_last_played_save()
	game_end()
}

function open_settings() {
	obj_mainmenucontroller.menustate = menu_state.options
	if !instance_exists(obj_optionswindow){
		instance_create_depth(0,0,0,obj_optionswindow)
	}else{
		instance_destroy(obj_optionswindow)
	}
}

function open_creators(){
	show_message("Этот прототип создал AlexInCube")
}