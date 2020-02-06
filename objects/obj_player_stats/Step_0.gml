/// @description Insert description here
// You can write your code in this editor
if room=room_pause{exit}

if (hp<0){
	hp=0
}

if instance_exists(obj_player){
if(mana < maxmana and alarm[0] == -1){
	mana+=manaregen
	if mana>maxmana
	{
		mana=maxmana
	}
	alarm[0]=room_speed
}

if(hpregen < maxhp and alarm[1] == -1){
	hp+=hpregen
	if hp>maxhp
	{
		hp=maxhp
	}
	alarm[1]=room_speed
}
}

if obj_inventory.guistate!="isClosed"
{
var helm = global.item_index[# global.armor_equipped[# 0, 0], item_stat.physarmor]
var chest = global.item_index[# global.armor_equipped[# 1, 0], item_stat.physarmor]
var legg = global.item_index[# global.armor_equipped[# 2, 0], item_stat.physarmor]
var boots = global.item_index[# global.armor_equipped[# 3, 0], item_stat.physarmor]
var ring1 = global.item_index[# global.armor_equipped[# 4, 0], item_stat.physarmor]
var ring2 = global.item_index[# global.armor_equipped[# 5, 0], item_stat.physarmor]
physarmor=helm+chest+legg+boots+ring1+ring2

helm = global.item_index[# global.armor_equipped[# 0, 0], item_stat.magicarmor]
chest = global.item_index[# global.armor_equipped[# 1, 0], item_stat.magicarmor]
legg = global.item_index[# global.armor_equipped[# 2, 0], item_stat.magicarmor]
boots = global.item_index[# global.armor_equipped[# 3, 0], item_stat.magicarmor]
ring1 = global.item_index[# global.armor_equipped[# 4, 0], item_stat.magicarmor]
ring2 = global.item_index[# global.armor_equipped[# 5, 0], item_stat.magicarmor]
magicarmor=helm+chest+legg+boots+ring1+ring2

helm = global.item_index[# global.armor_equipped[# 0, 0], item_stat.strength]
chest = global.item_index[# global.armor_equipped[# 1, 0], item_stat.strength]
legg = global.item_index[# global.armor_equipped[# 2, 0], item_stat.strength]
boots = global.item_index[# global.armor_equipped[# 3, 0], item_stat.strength]
ring1 = global.item_index[# global.armor_equipped[# 4, 0], item_stat.strength]
ring2 = global.item_index[# global.armor_equipped[# 5, 0], item_stat.strength]
strength=helm+chest+legg+boots+ring1+ring2

helm = global.item_index[# global.armor_equipped[# 0, 0], item_stat.intelligence]
chest = global.item_index[# global.armor_equipped[# 1, 0], item_stat.intelligence]
legg = global.item_index[# global.armor_equipped[# 2, 0], item_stat.intelligence]
boots = global.item_index[# global.armor_equipped[# 3, 0], item_stat.intelligence]
ring1 = global.item_index[# global.armor_equipped[# 4, 0], item_stat.intelligence]
ring2 = global.item_index[# global.armor_equipped[# 5, 0], item_stat.intelligence]
intelligence=helm+chest+legg+boots+ring1+ring2

helm = global.item_index[# global.armor_equipped[# 0, 0], item_stat.luck]
chest = global.item_index[# global.armor_equipped[# 1, 0], item_stat.luck]
legg = global.item_index[# global.armor_equipped[# 2, 0], item_stat.luck]
boots = global.item_index[# global.armor_equipped[# 3, 0], item_stat.luck]
ring1 = global.item_index[# global.armor_equipped[# 4, 0], item_stat.luck]
ring2 = global.item_index[# global.armor_equipped[# 5, 0], item_stat.luck]
luck=helm+chest+legg+boots+ring1+ring2

var weapon = global.item_index[# global.armor_equipped[# 6, 0], item_stat.physdamage]
attack=weapon
var weapon = global.item_index[# global.armor_equipped[# 6, 0], item_stat.magicdamage]
magicattack=weapon
}