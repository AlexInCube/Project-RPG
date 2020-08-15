//Potions
scr_add_potion(item.small_health_potion,"small_health_potion", spr_ItemIcon_SmallHealPotion,4,scr_small_health_potion)
scr_add_potion(item.small_mana_potion,"small_mana_potion", spr_ItemIcon_SmallManaPotion,4,scr_small_mana_potion)
//Armor
scr_add_armor(item.iron_helmet,"iron_helmet", spr_ironhelmet,2,1,HELMET)
scr_add_armor(item.iron_chestplate,"iron_chestplate", spr_ironchestplate,4,2,CHESTPLATE)
scr_add_armor(item.iron_leggings,"iron_leggings", spr_ironleggings,3,1,LEGGINGS)
scr_add_armor(item.iron_boots,"iron_boots", spr_ironboots,2,1,BOOTS)
scr_add_armor(item.leather_helmet,"leather_helmet", spr_leatherhelmet,1,1,HELMET)
scr_add_armor(item.leather_chestplate,"leather_chestplate", spr_leatherchestplate,3,2,CHESTPLATE)
scr_add_armor(item.leather_leggings,"leather_leggings", spr_leatherleggings,2,1,LEGGINGS)
scr_add_armor(item.leather_boots,"leather_boots", spr_leatherboots,1,1,BOOTS)
//Weapon
/*
scr_add_weapon(item.iron_sword,"iron_sword", spr_ItemIcon_ironsword,10,0,scr_melee_attack)
scr_add_weapon(item.wooden_stick,"wooden_stick", spr_item_weapon_wooden_stick,2,0,scr_melee_attack)
scr_add_weapon(item.lightningstaff,"light_staff", spr_MagicWeaponLightningStaff,0,10,scr_range_attack)
*/
scr_add_weapon(item.shotgun,"shotgun", spr_item_weapon_shotgun,2,0,scr_shotgun_tick,scr_shotgun_draw)
//Spell
scr_add_spell(item.scroll_dash,"spell_scroll_dash",spr_ItemIcon_SpellDash,1,scr_spell_dash)
scr_add_spell(item.scroll_fireball,"spell_scroll_fireball",spr_ItemIcon_SpellFireball,1,scr_spell_fireball)
//Other
scr_add_components(item.greenleaf,"green_leaf",spr_ItemIcon_Leaf,16)
scr_add_components(item.blueleaf,"blue_leaf",spr_ItemIcon_blueleaf,16)
scr_add_components(item.small_empty_bottle,"empty_small_bottle",spr_ItemIcon_SmallBottle,8)
scr_add_components(item.slime,"slimeball",spr_ItemIcon_Slime,32)
scr_add_components(item.leather,"leather",spr_ItemIcon_Leather,16)
scr_add_components(item.iron_ore,"iron_ore",spr_ItemIcon_OreIron,8)
scr_add_components(item.iron_ingot,"iron_ingot",spr_ItemIcon_Iron,8)
scr_add_components(item.star_salve,"star_salve",spr_item_star_salve,1)
scr_add_components(item.coin,"coin",spr_item_coin,50)



show_debug_message("Registered "+string(ds_grid_height(global.item_index))+" items")