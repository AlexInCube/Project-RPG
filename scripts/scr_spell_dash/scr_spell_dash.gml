var manacost=1//argument0
if obj_player_stats.mana>=manacost and obj_player.state==scr_move_state and obj_player.alarm[0]==-1{
	obj_player.state = scr_dash_state;
	obj_player.alarm[0] = room_speed/8
	obj_player_stats.mana -=manacost
}
