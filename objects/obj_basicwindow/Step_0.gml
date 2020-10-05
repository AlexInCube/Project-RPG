var mousex = device_mouse_x_to_gui(0)
var mousey = device_mouse_y_to_gui(0)

mouseover = mouseover(window_x,window_y,window_x+window_width,window_y+window_height)

//If mouse over close button	
if placefree = true and mouseover(window_x+(window_width-23),window_y+5,window_x+(window_width-4),window_y+22)
{
	if mouse_check_button_pressed(mb_left)
	{
		instance_destroy()
	}
}
//If mouse over title of window
if placefree = true and mouseover(window_x+5,window_y+5,window_x+(window_width-23),window_y+22)
{
	if mouse_check_button_pressed(mb_left)
	{
		with(obj_basicwindow){
			activewindow=false
		}
		activewindow=true
		windowsetdepth()
		
		window_dragging=true
		mousexoffset = mousex - window_x
		mouseyoffset = mousey - window_y 
	}
}
//If window moving
if window_dragging
{
	window_x = mousex - mousexoffset
	window_y = mousey - mouseyoffset
	window_x = max(0,min(window_x,GUIWIDTH - mousexoffset)) 
	window_y = max(0,min(window_y,GUIHEIGHT - mouseyoffset))
	xx = window_x
	yy = window_y
	if mouse_check_button_released(mb_left)
	{
		window_dragging=false
		mousexoffset=0
		mouseyoffset=0
	}
}