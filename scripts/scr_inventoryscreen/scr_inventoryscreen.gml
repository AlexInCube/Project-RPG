function scr_inventoryscreen(argument0) {
	//Inventory Screen for Player/Chests inventories
	var windowid = id
	var inventory = argument0
	var inventory_size = ds_grid_width(inventory)
	var slotsxy
	var cell_size=32
	var slots_x=8
	var slots_y=32
	var x_buffer=1
	var y_buffer=1

	var iy = 0
	var ix = 0
	var ii = 0

	for(i=0;i<inventory_size;i++)
	{
		//Calculate coordinates for each slot
		slotsxy[i,0] = windowid.window_x+slots_x+((cell_size+x_buffer)*ix)
		slotsxy[i,1] = windowid.window_y+slots_y+((cell_size+y_buffer)*iy)
		ii++
		ix = ii mod 5
		iy = ii div 5
		//Draw sprite from item in slot
			if inventory[# i, 0]!=item.none
			{
				draw_sprite(global.item_index[# inventory[# i, 0], item_stat.sprite_index],1,slotsxy[i,0]+16,slotsxy[i,1]+16)
			}
			//Draw item amount if item amount in slots more than 1
			if inventory[# i, 1]>1
			{
				draw_text(slotsxy[i,0]+2,slotsxy[i,1]+12,inventory[# i, 1])
			}
	
		if windowid.placefree{
			scr_slot(inventory,i,slotsxy[i,0],slotsxy[i,1])
		}
	}

	if windowid.placefree{
		for(i=0;i<inventory_size;i++)
		{
		if inventory[# i, 0]!=item.none
			{
				if scr_mouseover(slotsxy[i,0],slotsxy[i,1],slotsxy[i,0]+32,slotsxy[i,1]+32)
				{
					scr_draw_item_stat_mouse(inventory,i)
				}
			}
		}
	
	}


}
