/// @description Healing lifeform parent
function heal(heal_amount,target,healperc) {
	if healperc
	{
		target.hp+=(target.max_hp.getValue()/100)*heal_amount
	}
	else
	{
		target.hp+=heal_amount
	}
	target.hp = clamp(target.hp,0,target.max_hp.getValue())
}

/// @description replenish_mana(manaamount,target,inpercentage?);
function replenish_mana(manaamount, target, manaperc) {
	if manaperc
	{
		target.mana+=(target.max_mana.getValue()/100)*manaamount
	}
	else
	{
		target.mana+=manaamount
	}
	target.mana = clamp(target.mana,0,target.max_mana.getValue())

}

#macro DAMAGE_TYPE_MAGIC 1
#macro DAMAGE_TYPE_PHYSICAL 2
#macro DAMAGE_TYPE_PURE 3

function apply_damage(target,dmg,dmg_type){
	if is_undefined(target) exit

	var magic_armor=target.stats.magic_armor.getValue()
	var phys_armor=target.stats.phys_armor.getValue()
	
	var finalDamage = dmg//If damage is PURE
	
	switch(dmg_type){
		case DAMAGE_TYPE_MAGIC:
			finalDamage=dmg*(dmg/(dmg+magic_armor))
		break
		case DAMAGE_TYPE_PHYSICAL:
			finalDamage=dmg*(dmg/(dmg+phys_armor))
		break
	}
	
	target.stats.hp = clamp(target.stats.hp-finalDamage,0,target.stats.max_hp.getValue())
	if target.stats.hp = 0{target.Die()}
	return finalDamage
}

///@description experience_give_exp(integer)
///@function experience_give_exp
///@param amount_xp
function experience_give_exp(experience){
	with (obj_player_stats){
		expr+=experience
		experience_lvl_up()
	}
}

function experience_calculate_next_lvl(level){
     return round( 0.04 * power(level,3) + 0.8 * power(level,2) + 2 * level)
}

function experience_lvl_up(){
	with (obj_player_stats)
	{
		if expr >= max_expr
		{
			expr -= max_expr
			level +=1
			max_expr = experience_calculate_next_lvl(level)
			attribute_points +=1
		}
	}
}

function drop_mob_loot(drop_chance,item_id,item_amount){
	if irandom(100)>=drop_chance
	{
		var loot = instance_create_layer(x,y,"Instances",obj_item)
		loot.whatitem = item_id
		loot.amount = item_amount
	}
}