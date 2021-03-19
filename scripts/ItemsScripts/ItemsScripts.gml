#macro NBTdata nbtdata
function default_item() constructor{
	item_unlocale_name = UNKNOWN_ITEM
	item_locale_name = find_keyword(item_unlocale_name)
	item_sprite = spr_unknown_item
	item_description = find_keyword(item_unlocale_name+"_description")
	item_stacking = 1
	item_create = {}
	render_item = default_item_render
	item_type = ITEM_TYPE_COMPONENTS
}

function default_armor() : default_item() constructor{
	phys_armor = 0
	magic_armor = 0
	item_type = ITEM_TYPE_HELMET
}

function default_quick_useable() : default_item() constructor{
	quick_use = nothing
	arg_array = []
	item_type = ITEM_TYPE_SPELL
}

#region Consumable
	//Health potion
	function health_potion() : default_quick_useable() constructor{ 
		quick_use = function(heal_amount,heal_perc,inv_arr){
			if obj_player_stats.hp < obj_player_stats.max_hp{
				heal(heal_amount,obj_player_stats,heal_perc)
				item_consume(item_get_inventory(inv_arr),item_get_slot(inv_arr))
			}
		}
	}
	//Big health potion
	function big_health_potion() : default_quick_useable() constructor{
		item_create = {
			uses : 3,
		}
		maxuses = 3
		render_item = consumable_potion_render
		quick_use = function(heal_amount,heal_perc,inv_arr){
			//if obj_player_stats.hp < obj_player_stats.max_hp{
				heal(heal_amount,obj_player_stats,heal_perc)
				var inv = item_get_inventory(inv_arr)
				var _slot = item_get_slot(inv_arr)
				var slot_struct = inv[# _slot,2]
				slot_struct[$ "uses"] -=1
				if slot_struct[$ "uses"] <= 0{
					item_consume(inv,_slot)
					item_gain("empty_big_bottle",1,inv,_slot)
				}
			//}
		}
	}
	//Mana potion
	function mana_potion() : default_quick_useable() constructor{
		quick_use = function(mana_amount,mana_perc,inv_arr) {
			if obj_player_stats.mana < obj_player_stats.max_mana{
				replenish_mana(mana_amount,obj_player_stats,mana_perc)
				item_consume(item_get_inventory(inv_arr),item_get_slot(inv_arr))
			}
		}
	}
	//Regen potion
	function regeneration_potion() : default_quick_useable() constructor{ 
		quick_use = function(duration,inv_arr){
			effect_apply(obj_player_stats,BUFF_REGENERATION,duration)
			item_consume(item_get_inventory(inv_arr),item_get_slot(inv_arr))
		}
	}
	//Attack potion
	function attack_potion() : default_quick_useable() constructor{ 
		quick_use = function(duration,inv_arr){
			effect_apply(obj_player_stats,BUFF_ATTACK,duration)
			item_consume(item_get_inventory(inv_arr),item_get_slot(inv_arr))
		}
	}
	//Def potion
	function defense_potion() : default_quick_useable() constructor{ 
		quick_use = function(duration,inv_arr){
			effect_apply(obj_player_stats,BUFF_DEFENSE,duration)
			item_consume(item_get_inventory(inv_arr),item_get_slot(inv_arr))
		}
	}
#endregion

#region Spells
function spell_dash() : default_quick_useable() constructor{
	quick_use = function(manacost){
		if is_mana_enough(manacost) and obj_player.state == move_state
		{
			obj_player.state = dash_state;
			obj_player.alarm[0] = (convert_seconds_to_ticks(1)/8)*DELTATIME
			mana_consume(manacost)
		}
	}
}

function spell_fireball() : default_quick_useable() constructor {
	quick_use = function(manacost){
		if is_mana_enough(manacost) and obj_player.state == move_state
		{
			var mouse_dir = point_direction(x,y,mouse_x,mouse_y)
			var dmg = create_damage(spr_fireball,obj_player.id,0,20,true)
			var xforce = lengthdir_x(18,mouse_dir)
			var yforce = lengthdir_y(18,mouse_dir)
			with dmg
			{
				physics_apply_impulse(x,y,xforce,yforce)
				if obj_player_stats.magic_damage>0
				{
				damage = obj_player_stats.magic_damage
				damagetype = MAGICDAMAGETYPE
				knockback = 0
				}
			}
	
			mana_consume(manacost)
		}
	}
}
#endregion

#region Weapons
function shotgun() : default_item() constructor{
	ammo_max = 6
	item_create = {
		ammo : ammo_max
	}
}

function light_staff() : default_item() constructor{
	mana_cost = 0.5
	light_radius = 50
	jump_count = 4
	item_create = {
	}
}
#endregion

#region Other
function wooden_bucket() : default_quick_useable() constructor {
	quick_use = function(inv_arr){
		var inv = item_get_inventory(inv_arr)
		var _slot = item_get_slot(inv_arr)
		item_consume(inv,_slot)
		item_gain("wooden_water_bucket",1,inv,_slot)
	}
}

function money() : default_item() constructor{
	render_item = money_render
}
#endregion