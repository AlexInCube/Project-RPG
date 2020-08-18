instance_destroy(obj_weapon_controller)

if !instance_exists(obj_weapon_controller) and global.armor_equipped[# 4, 0] != item.none{
	var inst = instance_create_layer(obj_player.x,obj_player.y,"Instances",obj_weapon_controller)
	with(inst){
		weapon_tick_script = global.item_index[# global.armor_equipped[# 4, 0], item_stat.weapon_tick]
		weapon_draw_script = global.item_index[# global.armor_equipped[# 4, 0], item_stat.weapon_draw]
		weapon_create_script = global.item_index[# global.armor_equipped[# 4, 0], item_stat.weapon_create]
		weapon_alarm_script = global.item_index[# global.armor_equipped[# 4, 0], item_stat.weapon_alarm]
		script_execute(weapon_create_script)
	}
}