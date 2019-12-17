/// @description scr_heal(manaamount,target,inpercentage?);
/// @function scr_replenish_mana
/// @param mana
/// @param target
/// @param healinpercentage?

var manaamount = argument0
var target = argument1
var manaperc = argument2


if manaperc = true
{
	if manaamount>100{manaamount = 100}
	target.mana+=target.maxmana/manaamount
}
else
{
	target.mana+=manaamount
}
if target.mana>target.maxmana
{
	target.mana=target.maxmana
}