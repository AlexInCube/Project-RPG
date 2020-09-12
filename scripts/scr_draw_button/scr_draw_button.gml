///@description draw_button_hud(x,y,x2,y2,sprite,script)
///@arg x
///@arg y
///@arg x2
///@arg y2
///@arg sprite
///@arg script
function draw_button_hud(xx,yy,x2,y2,sprite,script) {
	var subimage = 0
	
	if mouseover(xx,yy,x2,y2)
	{
		subimage = 1
		if mouse_check_button_pressed(mb_left)
		{
			script_execute_alt(script,argument[6])
		}
	}else subimage = 0

	draw_sprite(sprite,subimage,xx,yy)
}