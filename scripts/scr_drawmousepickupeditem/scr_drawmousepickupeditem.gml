function drawmousepickupeditem() {
	var iid = global.mouse_slot[# 0, 0];
	var amount = global.mouse_slot[# 0, 1];

	if (iid != item.none)
	{
		draw_sprite(global.item_index[# iid, item_stat.sprite_index], 0, device_mouse_x_to_gui(0), device_mouse_y_to_gui(0)); //Draw item sprite
		if amount>1
		{
		draw_text(device_mouse_x_to_gui(0)+2, device_mouse_y_to_gui(0)+2, string(amount)); //Draw item quantity
		}
	}


}
