/// @description Healing lifeform parent
/// @function heal(heal,target,healinpercentage?);
/// @param heal
/// @param target
/// @param healinpercentage?
function heal(heal_amount,target,healperc) {
	if healperc
	{
		target.hp+=(target.max_hp/100)*heal_amount
	}
	else
	{
		target.hp+=heal_amount
	}
	target.hp = clamp(target.hp,0,target.max_hp)
}

/// @description replenish_mana(manaamount,target,inpercentage?);
/// @function replenish_mana
/// @param mana
/// @param target
/// @param healinpercentage?
function replenish_mana(manaamount, target, manaperc) {
	if manaperc
	{
		target.mana+=(target.max_mana/100)*manaamount
	}
	else
	{
		target.mana+=manaamount
	}
	target.mana = clamp(target.mana,0,target.max_mana)

}

///@function applydamage(damagecount,damagetype,damagetype,show_damage,show_dmg_x,show_dmg_y)
///@param damagecount
///@param damagetype
///@param target
///@param show_damage
///@param show_dmg_x
///@param show_dmg_y
#macro MAGICDAMAGETYPE 1
#macro PHYSICALDAMAGETYPE 2
#macro PUREDAMAGETYPE 3

function applydamage() {
	var damagecount = argument[0]
	var damagetype = argument[1]
	var target = argument[2]
	var showdmg = argument[3]
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



	if showdmg = true/* and target.object_index != obj_bush*/{
		if global.settings.interface.showdamage = true{
		var showdmg = instance_create_layer(target.x,target.y,"Text",obj_show_damage)
			showdmg.damage = damage
			showdmg.xx=argument[4]
			showdmg.yy=argument[5]
		}
	}

	if damage>0 return damage else return 0
}

///@description get_exp(integer)
///@function get_exp
///@param amount_xp
function get_exp(experience){
	with (obj_player_stats){
		expr+=experience
		lvl_up()
	}
}

function max_exp_calc(level){
     return round( 0.04 * power(level,3) + 0.8 * power(level,2) + 2 * level)
}

function lvl_up(){
	with (obj_player_stats)
	{
		if expr >= max_expr
		{
			expr -= max_expr
			level +=1
			max_expr = max_exp_calc(level)
			attribute_points +=1
		}
	}
}
	
function recalculate_stats(argument0) {
	var inventory = argument0
	var ds_width = ds_grid_width(inventory)
	var h_p,m_p,armor=0,magicarmor=0,physdamage=0,magicdamage=0,str=0;
	for(i=0;i<ds_width;i++){
		armor +=			global.item_index[# inventory[# i, 0], item_stat.physarmor]
		magicarmor +=		global.item_index[# inventory[# i, 0], item_stat.magicarmor]
		physdamage +=		global.item_index[# inventory[# i, 0], item_stat.physdamage]
		magicdamage +=		global.item_index[# inventory[# i, 0], item_stat.magicdamage]
		//str +=				global.item_index[# inventory[# i, 0], item_stat.strength]
	}
	with(obj_player_stats){
		phys_armor = armor + defense
		magic_armor = magicarmor + defense
		phys_damage = physdamage + strength
		magic_damage = magicdamage + strength
		evasion = agility
		regen_amount = agility
		max_hp = defense
		max_mana = energy
		//strength = str
	}


	weapon_equip()
}
