if (alarm[0] <= 0){
	state = choose(scr_enemy_idle_state_chinlin,scr_enemy_wander_state_chinlin)
	alarm[0] = room_speed*irandom_range(1,2)
	if state == scr_enemy_wander_state_chinlin 
	{
		xaxis = random_range(-1,1)
		yaxis = random_range(-1,1)
	}
}