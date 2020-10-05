function spell_dash(argument0) {
	var manacost=argument0

	if obj_player_stats.mana>=manacost and obj_player.state==move_state
	{
		obj_player.state = dash_state;
		obj_player.alarm[0] = room_speed/8
		obj_player_stats.mana -=manacost
	}




}
