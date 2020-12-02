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
