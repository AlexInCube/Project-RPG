function weapon_equip() {
	instance_destroy(obj_weapon_controller)

	if !instance_exists(obj_weapon_controller) and global.equipment[# 4, 0] != item.none{
		var inst = instance_create_layer(obj_player.x,obj_player.y,"Instances",obj_weapon_controller)
		with(inst){
			weapon_create_script = global.item_index[# global.equipment[# 4, 0], item_stat.weapon_create]
			script_execute(weapon_create_script)
		}
	}


}
