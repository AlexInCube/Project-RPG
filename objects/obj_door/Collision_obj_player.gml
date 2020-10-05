if (room_exists(new_room)){
	global.load_state = load_state.none
	room_goto(new_room)
	obj_player.x = new_x
	obj_player.y = new_y
}