if obj_controller.inventory_key{show_inventory = !show_inventory}

if show_inventory{
	var mousex = device_mouse_x_to_gui(0)
	var mousey = device_mouse_y_to_gui(0)
	
	
	if scr_mouseover(window_x+157,window_y+4,window_x+175,window_y+22)
	{
		if mouse_check_button_pressed(mb_left)
		{
		show_inventory = false
		}
	}
	
	if scr_mouseover(window_x+5,window_y+5,window_x+155,window_y+22)
	{
		if mouse_check_button_pressed(mb_left)
		{
			window_dragging=true
			mousexoffset = mousex - window_x
			mouseyoffset = mousey - window_y 
		}
	}
	
	if window_dragging
	{
		window_x = mousex - mousexoffset
		window_y = mousey - mouseyoffset
		window_x = max(0,min(window_x,GUIWIDTH - mousexoffset)) 
		window_y = max(0,min(window_y,GUIHEIGHT - mouseyoffset))
		xx = window_x
		yy = window_y
		event_user(0)
		if mouse_check_button_released(mb_left)
		{
			window_dragging=false
			mousexoffset=0
			mouseyoffset=0
		}
	}
}
