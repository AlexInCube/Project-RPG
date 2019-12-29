/// @description scr_draw_slot(inventory_id,slot_id,x,y);
/// @function scr_draw_slot
/// @param inventory_ID
/// @param slot_ID
/// @param x
/// @param y
/// @param imageindexOptional
/// @param alloweditemtype
/// @param alloweditemtype

var inventory = argument[0]
var slot_id = argument[1]
var xx = argument[2]
var yy = argument[3]
var imageindex = 0
var typeneed = item.none
var typeneed2 = item.none
if argument_count>=6
{
typeneed = argument[5]
}
if argument_count>=7
{
var typeneed2 = argument[6]
}


if argument_count>=5
{
	var imageindex = argument[4]
}

	draw_sprite(spr_slot,imageindex,xx,yy)
	
	
	
	if (inventory[# slot_id, 0] != item.none)//Check if slot not empty
	{
		
		var itemsprite = inventory[# slot_id, 0]//get item sprite
		draw_sprite(global.item_index[# itemsprite, item_stat.sprite_index],1,xx+16,yy+16)//draw item sprite
		
		if global.item_index[# itemsprite, item_stat.type]=item_type.spell
		{
			draw_text_colour(xx+1,yy+15,global.item_index[# itemsprite, item_stat.manacost],c_blue,c_blue,c_blue,c_blue,1)
		}
		draw_set_color(c_black)
		if inventory[# slot_id, 1]>1
		{
		draw_text(xx+16,yy+15,inventory[# slot_id, 1])//draw item amount
		
		}
	}
	//draw_text(xx,yy+15,slot_id)//Slot ID
	

	
if scr_mouseover(xx,yy,xx+32,yy+32){
	//If mouse left click over slot and them have any item, take all amount of items or we have item in mouse then we put or switch items in slots
	draw_sprite(spr_slot_backlight,0,xx,yy)
	
	if argument_count<5
	{
		if mouse_check_button_pressed(mb_left)
		{
		var iid = inventory[# slot_id, 0]
		var amount = inventory[# slot_id, 1]
		var mouse_iid = global.mouse_slot[# 0, 0];
		var mouse_amount = global.mouse_slot[# 0, 1];

		if (iid == 0 || mouse_iid == 0 || iid != mouse_iid) //If either slot is empty, or the two slots don't match
		 {
			//Switch the slots
			inventory[# slot_id, 0] = mouse_iid;
			inventory[# slot_id, 1] = mouse_amount;
			global.mouse_slot[# 0, 0] = iid;
			global.mouse_slot[# 0, 1] = amount;
			}
		else if (iid == mouse_iid) //If both slots are the same
		 {
			//Take all mouse items and put them in inventory
			
			while inventory[# slot_id, 1] < global.item_index[# inventory[# slot_id, 0], item_stat.stackable] and global.mouse_slot[# 0, 1]>0
			 {
				inventory[# slot_id, 1] += 1;
				global.mouse_slot[# 0, 1] -= 1;
				if (global.mouse_slot[# 0, 1] <= 0)
				 {
					global.mouse_slot[# 0, 0] = item.none;
					global.mouse_slot[# 0, 1] = 0;
					
					}
				}
			}
			
		}
	}
	else
	{
		if global.item_index[# global.mouse_slot[# 0, 0],item_stat.type]==typeneed or global.item_index[# global.mouse_slot[# 0, 0],item_stat.type]==typeneed2 or global.mouse_slot[# 0, 0]=item.none
		if mouse_check_button_pressed(mb_left)
		{
		var iid = inventory[# slot_id, 0]
		var amount = inventory[# slot_id, 1]
		var mouse_iid = global.mouse_slot[# 0, 0];
		var mouse_amount = global.mouse_slot[# 0, 1];

		if (iid == 0 || mouse_iid == 0 || iid != mouse_iid) //If either slot is empty, or the two slots don't match
		 {
			//Switch the slots
			inventory[# slot_id, 0] = mouse_iid;
			inventory[# slot_id, 1] = mouse_amount;
			global.mouse_slot[# 0, 0] = iid;
			global.mouse_slot[# 0, 1] = amount;
			}
		else if (iid == mouse_iid) //If both slots are the same
		 {
			//Take all mouse items and put them in inventory
			while inventory[# slot_id, 1] < global.item_index[# inventory[# slot_id, 0], item_stat.stackable] and global.mouse_slot[# 0, 1]>0
			 {
				inventory[# slot_id, 1] += 1;
				global.mouse_slot[# 0, 1] -= 1;
				if (global.mouse_slot[# 0, 1] <= 0)
				 {
					global.mouse_slot[# 0, 0] = item.none;
					global.mouse_slot[# 0, 1] = 0;
					exit;
					}
				}
			}
		}
	}
	
	//If mouse right click over slot and them have any item, take only one item from stack
	if mouse_check_button_pressed(mb_right)
	{
		if global.mouse_slot[# 0, 0]==item.none or global.mouse_slot[# 0, 0]==inventory[# slot_id, 0]//To grab more items in mouse slot, we check match in slots
		{
				if global.mouse_slot[# 0, 1]< global.item_index[# inventory[# slot_id, 0], item_stat.stackable]//If item max stack more them amount item in mouse, we grab one more item.
				{
				inventory[# slot_id, 1] -= 1
				var iid = inventory[# slot_id, 0]
				global.mouse_slot[# 0, 0] = iid;
				global.mouse_slot[# 0, 1] += 1
			
				if inventory[# slot_id, 1] < 1//If amount of items where we grab them has become zero, remove info in slot about this item.
				{
					inventory[# slot_id, 0] = item.none
					inventory[# slot_id, 1] = 0
				}
			}
		}
	}
	if inventory[# slot_id, 0] != item.none{scr_draw_item_stat_mouse(inventory,slot_id)}
	
	if obj_controller.drop_item_key
	{
		if inventory[# slot_id, 0] != item.none
		{
			var xx=obj_player.x
			var yy=obj_player.y
			var itemdropped=instance_create_layer(xx,yy,"Instances",obj_item)
			itemdropped.whatitem=inventory[# slot_id, 0]
			itemdropped.amount=inventory[# slot_id, 1]
			inventory[# slot_id, 0]=item.none
			inventory[# slot_id, 1]=0
		}
	}
}
	