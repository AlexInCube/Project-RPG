#region General scripts
function item_get_inventory(array){
	return array_get(array,0)
}
function item_get_slot(array){
	return array_get(array,1)
}
function item_consume(inventory,slot_id){
	inventory[# slot_id,1]-=1//Decrease quantity
	if inventory[# slot_id,1]<=0//If quantity = 0, then remove item
	{
		inventory[# slot_id,0]=item.none
	}
	//show_debug_message("Item Consume: Inventory: "+string(inventory)+" Slot: "+string(slot_id))
}
function is_mana_enough(mana_amount){
	if obj_player_stats.mana>=mana_amount return true
}
function mana_consume(mana_amount){
	obj_player_stats.mana -=mana_amount
}
#endregion 
#region Consumable
	function health_potion(heal_amount,heal_perc){
		if obj_player_stats.hp < obj_player_stats.max_hp{
			heal(heal_amount,obj_player_stats,heal_perc)
			item_consume(item_get_inventory(argument[2]),item_get_slot(argument[2]))
		}
	}
	
	function mana_potion(mana_amount,mana_perc) {
		if obj_player_stats.mana < obj_player_stats.max_mana{
			replenish_mana(mana_amount,obj_player_stats,mana_perc)
			item_consume(item_get_inventory(argument[2]),item_get_slot(argument[2]))
		}
	}
#endregion

#region Spells
function spell_dash(manacost) {
	if is_mana_enough(manacost) and obj_player.state == move_state
	{
		obj_player.state = dash_state;
		obj_player.alarm[0] = room_speed/8
		mana_consume(manacost)
	}
}

function spell_fireball(manacost) {
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
#endregion