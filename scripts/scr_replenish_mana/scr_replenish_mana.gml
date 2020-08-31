/// @description scr_heal(manaamount,target,inpercentage?);
/// @function scr_replenish_mana
/// @param mana
/// @param target
/// @param healinpercentage?
function scr_replenish_mana(argument0, argument1, argument2) {

	var manaamount = argument0
	var target = argument1
	var manaperc = argument2


	if manaperc = true
	{
		if manaamount>100{manaamount = 100}
		target.mana+=(target.max_mana/100)*manaamount
	}
	else
	{
		target.mana+=manaamount
	}
	if target.mana>target.max_mana
	{
		target.mana=target.max_mana
	}


}
