/// @description Attack state
if !bat_check_for_player(){
	bat_set_idle_state()
	exit
}
bat_set_aggresive_state()