///@description scr_applydeclinebutton(x,y,txt,script)
///@arg xx
///@arg yy
///@arg txt
///@arg script
function scr_applydeclinebutton(argument0, argument1, argument2, argument3) {
	var xx = argument0
	var yy = argument1
	var txt = argument2
	var script = argument3
	var mouseover = false
	var sprite = spr_optionsapply
	var sprwidth = sprite_get_width(sprite)
	var sprheight = sprite_get_height(sprite)
	if scr_mouseover(xx,yy,xx+sprwidth,yy+sprheight){
		mouseover = true
		if mouse_check_button_pressed(mb_left){
			script_execute(script)
		}
	}
	draw_sprite(sprite,mouseover,xx,yy)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	var c = c_white
	draw_text_color(xx+sprwidth/2,yy+sprheight/2,txt,c,c,c,c,1)


}
