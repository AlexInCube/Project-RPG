function drawmousepickupeditem() {
	var iid = global.mouse_slot[# 0, 0];
	var amount = global.mouse_slot[# 0, 1];

	if (iid != NO_ITEM)
	{
		var spr = return_struct_from_item_index_by_item_id(iid)[$ "item_sprite"]
		draw_sprite(spr, 0, device_mouse_x_to_gui(0), device_mouse_y_to_gui(0)); //Draw item sprite
		if amount>1
		{
		draw_text(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0)-15, string(amount)); //Draw item quantity
		}
	}
}

function return_struct_from_item_index_by_item_id(item_id){
	return global.item_index[? item_id]
}

function return_struct_from_item_index_by_item_inv(inventory,slot_id){
	var item_id = inventory[# slot_id,0]
	return global.item_index[? item_id]
}
/// @description slot(inventory_id,slot_id,x,y);
/// @function slot
function slot(inventory, slot_id, xx, yy, clickable, itemtype) {
	//Draw item render
	var _item = inventory[# slot_id,0]
	if _item != NO_ITEM{
		var _item_struct = return_struct_from_item_index_by_item_id(_item)
		var _item_render = _item_struct[$ "render_item"]
		var _item_stack = _item_struct[$ "item_stacking"]
		if is_method(_item_render){
			_item_render = method_get_index(_item_render)
		}
		//console_log(_item_args)
		if _item_render != -1//If item has script
		{
			var _item_args = [xx,yy,inventory,slot_id]
			script_execute_ext(_item_render,_item_args)
		}
	}	
	//If not allow click, dont continue code
	if !clickable{exit} 
	
	if mouseover(xx,yy,xx+32,yy+32){
		//If mouse left click over slot and them have any item, take all amount of items or we have item in mouse then we put or switch items in slots
		draw_sprite(spr_slot_backlight,0,xx,yy)
		if _item != NO_ITEM{
			var _item = inventory[# slot_id,0]
			var _item_struct = return_struct_from_item_index_by_item_id(_item)
			var txt = _item_struct[$ "item_locale_name"]+"\n"+find_keyword(_item_struct[$ "item_type"])+"\n"+_item_struct[$ "item_description"]
			
			if !is_undefined(_item_struct[$ "stats"]){
				for (var i = 0; i < array_length(_item_struct[$ "stats"]); i++){
					var stat_struct = _item_struct[$ "stats"][@ i]
					var stat_name = variable_struct_get(obj_player_stats.stats,stat_struct[0]).stat_name
					var stat_type = stat_struct[@ 1]
					var stat_value = stat_struct[@ 2]
					
					if sign(stat_value) == 1{
						var stat_sign = "+"
					}else if sign(stat_value) == -1{
						var stat_sign = ""
					}
					
					if stat_type == modifier_type.multiplier{
						txt += "\n"+stat_sign+string(stat_value*100)+"%"
					}else{
						txt += "\n"+stat_sign+string(stat_value)
					}
					
					txt += " "+stat_name
				}
			}
			draw_overlay(draw_text_hover,[txt,spr_hover_item_description,c_white,fa_center])
		}
		
		if mouse_check_button_pressed(mb_left)
		{
			//Filter item type
			if !is_undefined(itemtype){
				if global.mouse_slot[# 0,0] != NO_ITEM{
					var _item_struct = return_struct_from_item_index_by_item_id(global.mouse_slot[# 0,0])
					if _item_struct[$ "item_type"] != itemtype{
						exit
					}
				}
			}
			
			var iid = inventory[# slot_id, 0]
			var iid_before_click = iid
			var amount = inventory[# slot_id, 1]
			var nbt = inventory[# slot_id, 2]
			var mouse_iid = global.mouse_slot[# 0, 0];
			var mouse_amount = global.mouse_slot[# 0, 1];
			var mouse_nbt = global.mouse_slot[# 0, 2];

			if (iid == NO_ITEM || mouse_iid == NO_ITEM || iid != mouse_iid) //If either slot is empty, or the two slots don't match
			{
				//Switch the slots
				inventory[# slot_id, 0] = mouse_iid;
				inventory[# slot_id, 1] = mouse_amount;
				inventory[# slot_id, 2] = mouse_nbt;
				global.mouse_slot[# 0, 0] = iid;
				global.mouse_slot[# 0, 1] = amount;
				global.mouse_slot[# 0, 2] = nbt;
			}
			else if (iid == mouse_iid) //If both slots are the same
			{
				if nbt == mouse_nbt{
					inventory[# slot_id, 2] = global.mouse_slot[# 0, 2]
				//Take all mouse items and put them in inventory
					while inventory[# slot_id, 1] < _item_stack and global.mouse_slot[# 0, 1]>0
					{
						inventory[# slot_id, 1] += 1;
						global.mouse_slot[# 0, 1] -= 1;
						if (global.mouse_slot[# 0, 1] <= 0)
						{
							global.mouse_slot[# 0, 0] = 0;
							global.mouse_slot[# 0, 1] = 0;
							global.mouse_slot[# 0, 2] = 0;
						}
					}
				}
			}
			event_fire(EVENT_INVENTORY_CLICKED,{inv : inventory, slot : slot_id, item_before_click : iid_before_click})
		}
	
	
		//If mouse right click over slot and them have any item, take only one item from stack
		if mouse_check_button_pressed(mb_right)
		{
			var iid = inventory[# slot_id, 0]
			var amount = inventory[# slot_id, 1]
			var nbt = inventory[# slot_id, 2]
			if global.mouse_slot[# 0, 0] == NO_ITEM or global.mouse_slot[# 0, 0] == iid//To grab more items in mouse slot, we check match in slots
			{
					if global.mouse_slot[# 0, 1] < _item_stack//If item max stack more them amount item in mouse, we grab one more item.
					{
						
					inventory[# slot_id, 1] -= 1
					var iid = inventory[# slot_id, 0]
					global.mouse_slot[# 0, 0] = iid;
					global.mouse_slot[# 0, 1] += 1
					global.mouse_slot[# 0, 2] = nbt
			
					if inventory[# slot_id, 1] < 1//If amount of items where we grab them has become zero, remove info in slot about this item.
					{
						inventory[# slot_id, 0] = NO_ITEM
						inventory[# slot_id, 1] = 0
						inventory[# slot_id, 2] = 0
					}
				}
			}
		}
	
	
		//Drop Item From Inventory
		if obj_inputManager.drop_item_key and inventory[# slot_id, 0] != 0
		{
			var _xx=obj_player.x
			var _yy=obj_player.y
		
			if obj_inputManager.combination_key
			{
				var itemdropped=instance_create_layer(_xx,_yy,"Instances",obj_item)
				itemdropped.whatitem=inventory[# slot_id, 0]
				itemdropped.amount=1
			
				inventory[# slot_id, 1]-=1
				if inventory[# slot_id, 1]==0
				{
					inventory[# slot_id, 0]=NO_ITEM
					inventory[# slot_id, 1]=0
					inventory[# slot_id, 2]=0
				}
			}
			else
			{
				var itemdropped=instance_create_layer(_xx,_yy,"Instances",obj_item)
				itemdropped.whatitem=inventory[# slot_id, 0]
				itemdropped.amount=inventory[# slot_id, 1]
				inventory[# slot_id, 0]=NO_ITEM
				inventory[# slot_id, 1]=0
				inventory[# slot_id, 2]=0
			}
		}
	}
}
	
//Hotbar item using
function slot_script_execute(inventory, slot_id) {
	var _item = inventory[# slot_id,0]
	var _item_struct = return_struct_from_item_index_by_item_id(_item)
	if !is_undefined(_item_struct) and _item_struct !=-1{
		if !is_undefined(_item_struct[$ "quick_use"]){
			var _item_script = method_get_index(_item_struct[$ "quick_use"])
			if _item_script != -1//If item have script
			{
				//console_log(_item_script)
				var src = _item_struct[$ "arg_array"]
				var _item_args = []; array_copy(_item_args,0,src,0,array_length(src))
				array_push(_item_args,[inventory,slot_id])//Push inv and slot_id to item script
				//console_log(_item_args)
				script_execute_ext(_item_script,_item_args)
			}
		}
	}
}