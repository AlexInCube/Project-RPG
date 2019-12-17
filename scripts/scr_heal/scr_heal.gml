/// @description scr_heal(heal,target,healinpercentage?);
/// @function scr_heal
/// @param heal
/// @param target
/// @param healinpercentage?

var heal = argument0
var target = argument1
var healperc = argument2


if healperc = true
{
	if heal>100{heal = 100}
	target.hp+=target.maxhp/heal
}
else
{
	target.hp+=heal
}
if target.hp>target.maxhp
{
	target.hp=target.maxhp
}