///@function scr_applydamage
///@param damagecount
///@param damagetype
///@param target
#macro MAGICDAMAGETYPE 1
#macro PHYSICALDAMAGETYPE 2
#macro PUREDAMAGETYPE 3

var damagecount = argument0
var damagetype = argument1
var target = argument2
if object_get_name(target.object_index) == object_get_name(obj_player.object_index){
var magarmor=obj_player_stats.magicarmor
var armor=obj_player_stats.physarmor
}
else
{
var magarmor=target.magicarmor
var armor=target.physarmor	
}
var damage

if damagetype=MAGICDAMAGETYPE
{
damage=damagecount*(damagecount/(damagecount+magarmor))
}

if damagetype=PHYSICALDAMAGETYPE
{
damage=damagecount*(damagecount/(damagecount+armor))
}

if damagetype=PUREDAMAGETYPE
{
damage=damagecount
}

show_debug_message(string(damagecount)+string(damage))

if damage>0 return damage else return 0
