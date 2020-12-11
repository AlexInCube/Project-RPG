#macro UNKNOWN_ITEM "Unknown Item"
function registeritems() {
	#region Potions
	add_potion("small_health_potion", spr_ItemIcon_SmallHealPotion,4,health_potion,[1,false])
	//add_potion(item.small_mana_potion,"small_mana_potion", spr_ItemIcon_SmallManaPotion,4,mana_potion,[5,false])
	#endregion
	/*
	#region Armor
	add_armor(item.iron_helmet,"iron_helmet", spr_ironhelmet,2,1,HELMET)
	add_armor(item.iron_chestplate,"iron_chestplate", spr_ironchestplate,4,2,CHESTPLATE)
	add_armor(item.iron_leggings,"iron_leggings", spr_ironleggings,3,1,LEGGINGS)
	add_armor(item.iron_boots,"iron_boots", spr_ironboots,2,1,BOOTS)
	add_armor(item.leather_helmet,"leather_helmet", spr_leatherhelmet,1,1,HELMET)
	add_armor(item.leather_chestplate,"leather_chestplate", spr_leatherchestplate,3,2,CHESTPLATE)
	add_armor(item.leather_leggings,"leather_leggings", spr_leatherleggings,2,1,LEGGINGS)
	add_armor(item.leather_boots,"leather_boots", spr_leatherboots,1,1,BOOTS)
	#endregion
	#region Weapon
	add_weapon(item.wooden_stick,"wooden_stick",spr_item_weapon_wooden_stick,2,0,wooden_stick_create)

	//add_weapon(item.iron_sword,"iron_sword", spr_ItemIcon_ironsword,10,0,melee_attack)

	//add_weapon(item.lightningstaff,"light_staff", spr_MagicWeaponLightningStaff,0,10,range_attack)
	
	add_weapon(item.shotgun,"shotgun", spr_item_weapon_shotgun,2,0,shotgun_create)
	#endregion
	#region Spell
	add_spell(item.scroll_dash,"spell_scroll_dash",spr_ItemIcon_SpellDash,spell_dash,[1])
	add_spell(item.scroll_fireball,"spell_scroll_fireball",spr_ItemIcon_SpellFireball,spell_fireball,[1])
	#endregion
	#region Other
	add_components(item.greenleaf,"green_leaf",spr_ItemIcon_Leaf,16)
	add_components(item.blueleaf,"blue_leaf",spr_ItemIcon_blueleaf,16)
	add_components(item.small_empty_bottle,"empty_small_bottle",spr_ItemIcon_SmallBottle,8)
	add_components(item.slime,"slimeball",spr_ItemIcon_Slime,32)
	add_components(item.leather,"leather",spr_ItemIcon_Leather,16)
	add_components(item.iron_ore,"iron_ore",spr_ItemIcon_OreIron,8)
	add_components(item.iron_ingot,"iron_ingot",spr_ItemIcon_Iron,8)
	add_components(item.star_salve,"star_salve",spr_item_star_salve,1)
	add_components(item.coin,"coin",spr_item_coin,50)
	#endregion
	show_debug_message("Registered "+string(ds_grid_height(global.item_index))+" items")
	*/
}
