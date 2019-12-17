///@description scr_mouseover(xx,yy,xx2,yy2)
///@function scr_mouseover
///@param xx
///@param yy
///@param xx2
///@param yy2
var xx=argument0
var yy=argument1
var xx2=argument2
var yy2=argument3


if point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),xx,yy,xx2,yy2)
{
	return true
}