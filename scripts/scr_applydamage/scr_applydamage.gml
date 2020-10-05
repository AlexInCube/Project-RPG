///@function applydamage
///@param damagecount
///@param damagetype
///@param target
///@param show_damage
#macro MAGICDAMAGETYPE 1
#macro PHYSICALDAMAGETYPE 2
#macro PUREDAMAGETYPE 3

function applydamage(argument0, argument1, argument2, argument3) {


	var damagecount = argument0
	var damagetype = argument1
	var target = argument2
	var showdmg = argument3
	if object_get_name(target.object_index) == object_get_name(obj_player.object_index){
		target = obj_player_stats.id
	}

	var magarmor=target.magic_armor
	var armor=target.phys_armor	
	
	switch(damagetype){
		case MAGICDAMAGETYPE:
			var damage=damagecount*(damagecount/(damagecount+magarmor))
		break
		case PHYSICALDAMAGETYPE:
			var damage=damagecount*(damagecount/(damagecount+armor))
		break
		case PUREDAMAGETYPE:
			var damage=damagecount
		break
	}



	if showdmg = true and target.object_index != obj_bush{
		if global.showdamage = true{
		var showdmg = instance_create_layer(target.x,target.y,"Text",obj_show_damage)
			showdmg.damage = damage
			showdmg.xx=target.x
			showdmg.yy=target.y
		}
	}

	if damage>0 return damage else return 0
}
