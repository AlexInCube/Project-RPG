#macro UNKNOWN_ITEM "Unknown Item" //if slot has item, but it ID doesnt exists in global.item_index
#macro NO_ITEM 0 //if slots dont have any item

#region Item Type Macro
#macro ITEM_TYPE_WEAPON "item_type_weapon"
#macro ITEM_TYPE_HELMET "item_type_helmet"
#macro ITEM_TYPE_CHESTPLATE "item_type_chestplate"
#macro ITEM_TYPE_LEGGINGS "item_type_leggings"
#macro ITEM_TYPE_BOOTS "item_type_boots"
#macro ITEM_TYPE_RING "item_type_ring"
#macro ITEM_TYPE_FOOD "item_type_food"
#macro ITEM_TYPE_COMPONENTS "item_type_components"
#macro ITEM_TYPE_POTION "item_type_potion"
#macro ITEM_TYPE_SPELL "item_type_spell"
#endregion

function registeritems() {
	#region Potions
	add_potion("small_health_potion", spr_ItemIcon_SmallHealPotion,4,health_potion,[1,false])
	add_potion("big_health_potion", spr_ItemIcon_BigHealPotion,1,big_health_potion,[25,true])
	add_potion("small_mana_potion", spr_ItemIcon_SmallManaPotion,4,mana_potion,[5,false])
	#endregion
	
	#region Armor
	add_armor("iron_helmet", spr_ironhelmet,2,1,ITEM_TYPE_HELMET,default_armor)
	add_armor("iron_chestplate", spr_ironchestplate,4,2,ITEM_TYPE_CHESTPLATE,default_armor)
	add_armor("iron_leggings", spr_ironleggings,3,1,ITEM_TYPE_LEGGINGS,default_armor)
	add_armor("iron_boots", spr_ironboots,2,1,ITEM_TYPE_BOOTS,default_armor)
	add_armor("leather_helmet", spr_leatherhelmet,1,1,ITEM_TYPE_HELMET,default_armor)
	add_armor("leather_chestplate", spr_leatherchestplate,3,2,ITEM_TYPE_CHESTPLATE,default_armor)
	add_armor("leather_leggings", spr_leatherleggings,2,1,ITEM_TYPE_LEGGINGS,default_armor)
	add_armor("leather_boots", spr_leatherboots,1,1,ITEM_TYPE_BOOTS,default_armor)
	#endregion
	
	#region Weapon
	add_weapon("wooden_stick",spr_item_weapon_wooden_stick,2,0,wooden_stick_create,default_item)
	//add_weapon("iron_sword", spr_ItemIcon_ironsword,10,0,melee_attack)
	//add_weapon("light_staff", spr_MagicWeaponLightningStaff,0,10,range_attack)
	add_weapon("shotgun", spr_item_weapon_shotgun,2,0,shotgun_create,shotgun)
	#endregion
	
	#region Spell
	add_spell("spell_dash",spr_ItemIcon_SpellDash,spell_dash,[1])
	add_spell("spell_fireball",spr_ItemIcon_SpellFireball,spell_fireball,[1])
	#endregion
	
	#region Other
	add_components("green_leaf",spr_ItemIcon_Leaf,16)
	add_components("blue_leaf",spr_ItemIcon_blueleaf,16)
	add_components("empty_small_bottle",spr_ItemIcon_SmallBottle,8)
	add_components("empty_big_bottle",spr_ItemIcon_BigBottle,2)
	add_components("slimeball",spr_ItemIcon_Slime,32)
	add_components("leather",spr_ItemIcon_Leather,16)
	add_components("iron_ore",spr_ItemIcon_OreIron,8)
	add_components("iron_ingot",spr_ItemIcon_Iron,8)
	add_components("star_salve",spr_item_star_salve,1)
	add_components("coin",spr_item_coin,50)
	add_components("meat",spr_ItemIcon_Meat,8)
	#endregion
	
	show_debug_message("Registered "+string(ds_list_size(global.item_index))+" items")
}
