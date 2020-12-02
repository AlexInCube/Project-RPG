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
	show_debug_message("Item Consume: Inventory: "+string(inventory)+" Slot: "+string(slot_id))
}
#endregion 
#region Consumable
	function health_potion(heal_amount,heal_perc){
		if obj_player_stats.hp < obj_player_stats.max_hp{
			heal(heal_amount,obj_player_stats,heal_perc)
			item_consume(item_get_inventory(argument[2]),item_get_slot(argument[2]))
		}
	}
	
	function mana_potion(heal_amount,heal_perc) {
		replenish_mana(20,obj_player_stats,true)
	}
#endregion

#region Spells
function spell_dash(manacost) {
	if obj_player_stats.mana>=manacost and obj_player.state==move_state
	{
		obj_player.state = dash_state;
		obj_player.alarm[0] = room_speed/8
		obj_player_stats.mana -=manacost
	}
}

function spell_fireball(argument0) {
	var manacost=argument0

	if obj_player_stats.mana>=manacost and obj_player.state!=dash_state
	{
		var damage = instance_create_layer(obj_player.x,obj_player.y,"Instances",obj_damageprojectile)
		damage.sprite_index=spr_fireball
		damage.creator = id
		damage.knockback = 0
	
		var xforce = lengthdir_x(20,obj_player.face*90)
		var yforce = lengthdir_y(20,obj_player.face*90)
		with damage
		{
			physics_apply_local_impulse(obj_player.x,obj_player.y,xforce,yforce)
		}
		damage.damage = 5
		damage.damagetype = MAGICDAMAGETYPE
	
		obj_player_stats.mana -=manacost
	}
}
#endregion