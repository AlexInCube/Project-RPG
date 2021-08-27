///@description Attack Prepare
if state == bat_attack_prepare{
	state = bat_attack_state
	if instance_exists(target){
		targetx = target.x
		targety = target.y
	}
}
