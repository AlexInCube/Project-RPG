if (room_exists(new_room)){
	if new_room != room{
		global.load_state = load_state.none
		obj_player.x = obj_player.phy_position_xprevious
		obj_player.y = obj_player.phy_position_yprevious
		global.directory_save = "autosave_"+(	
		string(date_get_day(date_current_datetime()))+"_"+
		string(date_get_month(date_current_datetime()))+"_"+
		string(date_get_year(date_current_datetime()))+"_"+
		string(date_get_hour(date_current_datetime()))+"_"+
		string(date_get_minute(date_current_datetime()))+"_"+
		string(date_get_second(date_current_datetime()))
		)
		save_game()
		room_goto(new_room)
		obj_player.x = new_x
		obj_player.y = new_y
	}else{
		obj_player.x = new_x
		obj_player.y = new_y
	}
}