/// @description Healing lifeform parent
/// @function heal(heal,target,healinpercentage?);
/// @param heal
/// @param target
/// @param healinpercentage?
function heal(heal_amount,target,healperc) {
	if healperc = true
	{
		if heal_amount>100{heal_amount = 100}
		target.hp+=(target.max_hp/100)*heal_amount
	}
	else
	{
		target.hp+=heal_amount
	}
	if target.hp>target.max_hp
	{
		target.hp=target.max_hp
	}
}
