/// @description scr_heal(heal,target,healinpercentage?);
/// @function scr_heal
/// @param heal
/// @param target
/// @param healinpercentage?
function scr_heal(argument0, argument1, argument2) {

	var heal = argument0
	var target = argument1
	var healperc = argument2


	if healperc = true
	{
		if heal>100{heal = 100}
		target.hp+=(target.max_hp/100)*heal
	}
	else
	{
		target.hp+=heal
	}
	if target.hp>target.max_hp
	{
		target.hp=target.max_hp
	}


}
