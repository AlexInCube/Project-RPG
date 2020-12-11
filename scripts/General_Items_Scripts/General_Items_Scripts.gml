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

function default_item_render(xx,yy,inventory,slot_id){
	draw_sprite(global.item_index[# inventory[# slot_id, 0], item_stat.sprite_index],1,xx+16,yy+16)
	//Draw item amount if item amount in slots more than 1
	if inventory[# slot_id, 1]>1
	{
		draw_set_halign(fa_right)
		draw_set_valign(fa_top)
		draw_set_font(fnt_small)
		draw_set_color(c_white)
		var item_amount = inventory[# slot_id, 1]
		draw_text(xx+32,yy+12,item_amount)
	}
}

#endregion 