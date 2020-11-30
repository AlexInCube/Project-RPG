script_execute(state)
if (obj_player_stats.hp <= 0) {
	instance_destroy()
	if !instance_exists(obj_player_corpse){
		instance_create_layer(x,y,"Instances",obj_player_corpse)
		obj_player_corpse.killer=obj_player_stats.last_hit
	}
}
depth=-bbox_bottom