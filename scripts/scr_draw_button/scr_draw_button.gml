///@description scr_draw_button(x,y,x2,y2,sprite,script)
///@arg x
///@arg y
///@arg x2
///@arg y2
///@arg sprite
///@arg script
var xx = argument0
var yy = argument1
var x2 = argument2
var y2 = argument3
var sprite = argument4
var script = argument5
var subimage = 0
if scr_mouseover(xx,yy,x2,y2)
{
	subimage = 1
	if mouse_check_button_pressed(mb_left)
	{
		script_execute(script)
	}
}else subimage = 0

draw_sprite(sprite,subimage,xx,yy)