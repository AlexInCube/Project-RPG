/// @description scr_draw_slot(inventory_id,slot_id,x,y);
/// @function scr_draw_slot
/// @param inventory_ID
/// @param slot_ID
/// @param x
/// @param y
function scr_draw_slot_output(argument0, argument1, argument2, argument3) {

	var inventory = argument0
	var slot_id = argument1
	var xx = argument2
	var yy = argument3

		draw_sprite(spr_slot,0,xx,yy)
		draw_set_color(c_black)
		if (inventory[# slot_id, 0] != item.none)//Check if slot not empty
		{
		
			var itemsprite = inventory[# slot_id, 0]//get item sprite
			draw_sprite(global.item_index[# itemsprite, item_stat.sprite_index],1,xx+16,yy+16)//draw item sprite
			if inventory[# slot_id, 1]>1
			{
			draw_text(xx+16,yy+15,inventory[# slot_id, 1])//draw item amount
			}
		}
	
	

	
	if scr_mouseover(xx,yy,xx+32,yy+32){
		//If mouse left click over slot and them have any item, take all amount of items or we have item in mouse then we put or switch items in slots
		draw_sprite(spr_slot_backlight,0,xx,yy)
	
		//If mouse right click over slot and them have any item, take only one item from stack
		if mouse_check_button_pressed(mb_left)
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
	}
	


}
