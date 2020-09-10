function recalculate_stats(argument0) {
	var inventory = argument0
	var ds_width = ds_grid_width(inventory)
	var hp,mp,armor=0,magicarmor=0,physdamage=0,magicdamage=0,strength=0,intelligence=0,luck=0;
	for(i=0;i<ds_width;i++){
		armor +=			global.item_index[# inventory[# i, 0], item_stat.physarmor]
		magicarmor +=		global.item_index[# inventory[# i, 0], item_stat.magicarmor]
		physdamage +=		global.item_index[# inventory[# i, 0], item_stat.physdamage]
		magicdamage +=		global.item_index[# inventory[# i, 0], item_stat.magicdamage]
		strength +=			global.item_index[# inventory[# i, 0], item_stat.strength]
		intelligence +=		global.item_index[# inventory[# i, 0], item_stat.intelligence]
		luck +=				global.item_index[# inventory[# i, 0], item_stat.luck]
	}
	mp=10+(intelligence*1)
	hp=10+(strength*1)
	obj_player_stats.phys_armor = armor
	obj_player_stats.magic_armor = magicarmor
	obj_player_stats.phys_damage = physdamage
	obj_player_stats.magic_damage = magicdamage
	obj_player_stats.strength = strength
	obj_player_stats.intelligence = intelligence
	obj_player_stats.luck = luck


	weapon_equip()



}
