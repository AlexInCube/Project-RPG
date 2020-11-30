depth =-100

enum settings_element_type{
	slider,
	shift,
	toggle,
	input,
	title
}


window_name=find_keyword("settings")
window_width=max(GUIHEIGHT,400)
window_height=max(GUIHEIGHT,300)
window_sprite=spr_basicwindow_without_close

create_ds_grid_settings()
ds_size = ds_grid_height(ds_options)

drawelementstart = 0//Start drawing ds_grid from position (height)
drawelementheight = min(round((GUIHEIGHT-20)/24)-2,ds_size)

inputting=false
toinput=0
input_button_half_width=sprite_get_width(spr_control_button)/2

applyword=find_keyword("apply_settings")
declineword=find_keyword("decline_settings")
set_to_defaultword=find_keyword("set_to_default")

function applydeclinebutton(xx,yy,txt,script) {
	var mouseover = false
	var sprite = spr_optionsapply
	var sprwidth = sprite_get_width(sprite)
	var sprheight = sprite_get_height(sprite)
	if mouseover(xx,yy,xx+sprwidth,yy+sprheight){
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
