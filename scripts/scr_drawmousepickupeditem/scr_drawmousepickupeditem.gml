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
