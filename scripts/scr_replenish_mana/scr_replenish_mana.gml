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
