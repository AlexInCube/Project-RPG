function default_item() constructor{
	item_unlocale_name = UNKNOWN_ITEM
	item_locale_name = find_keyword(item_unlocale_name)
	item_sprite = spr_unknown_item
	item_description = find_keyword(item_unlocale_name+"_description")
	item_stacking = 1 
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
	//Mana potion
	function mana_potion() : default_quick_useable() constructor{
		quick_use = function(mana_amount,mana_perc,inv_arr) {
			if obj_player_stats.mana < obj_player_stats.max_mana{
				replenish_mana(mana_amount,obj_player_stats,mana_perc)
				item_consume(item_get_inventory(inv_arr),item_get_slot(inv_arr))
			}
		}
	}
#endregion

#region Spells
function spell_dash() : default_quick_useable() constructor{
	quick_use = function(manacost){
		if is_mana_enough(manacost) and obj_player.state == move_state
		{
			obj_player.state = dash_state;
			obj_player.alarm[0] = room_speed/8
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