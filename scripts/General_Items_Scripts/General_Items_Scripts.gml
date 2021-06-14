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
		inventory[# slot_id,0]=NO_ITEM
		inventory[# slot_id,2]=0
	}
	//show_debug_message("Item Consume: Inventory: "+string(inventory)+" Slot: "+string(slot_id))
}

///@function read_NBT_data(inventory,slot_id,string variable)
function read_NBT_data(inventory,slot_id,variable){
	return inventory[# slot_id,2][$ variable]
}

///@function write_NBT_data(inventory,slot_id,string variable, value)
function write_NBT_data(inventory,slot_id,variable,value){
	inventory[# slot_id,2][$ variable] = value
}

///@function read_item_struct(inventory,slot_id,string variable)
function read_item_struct(inventory,slot_id,variable){
	return return_struct_from_item_index_by_item_inv(inventory,slot_id)[$ variable]
}

function is_mana_enough(mana_amount){
	return obj_player_stats.mana>=mana_amount
}

function mana_consume(mana_amount){
	obj_player_stats.mana -=mana_amount
}

function default_item_render(xx,yy,inventory,slot_id){
	var _item = inventory[# slot_id,0]
	var _item_struct = return_struct_from_item_index_by_item_id(_item)
	draw_sprite(_item_struct[$ "item_sprite"],1,xx+16,yy+16)
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

function consumable_potion_render(xx,yy,inventory,slot_id){
	var _item = inventory[# slot_id,0]
	var _item_struct = return_struct_from_item_index_by_item_id(_item)
	var _uses = inventory[# slot_id,2][$ "uses"]
	var _maxuses = _item_struct[$ "maxuses"]
	//if _uses == undefined exit
	draw_sprite(_item_struct[$ "item_sprite"],_maxuses-_uses,xx+16,yy+16)
	draw_set_halign(fa_right)
	draw_set_valign(fa_top)
	draw_set_font(fnt_small)
	draw_set_color(c_white)
	draw_text(xx+32,yy+12,string(_uses))
}

function money_render(xx,yy,inventory,slot_id){
	var _item = inventory[# slot_id,0]
	var _item_amount = inventory[# slot_id,1]
	var _item_struct = return_struct_from_item_index_by_item_id(_item)
	var _sub_img = 0
	if _item_amount>800{_sub_img = 4
	}else if _item_amount>600{_sub_img = 3
	}else if _item_amount>400{_sub_img = 2
	}else if _item_amount>200{_sub_img = 1}

	draw_sprite(_item_struct[$ "item_sprite"],_sub_img,xx+16,yy+16)
}

#endregion 