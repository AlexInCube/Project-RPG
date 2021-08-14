function draw_overlay(draw_scr,scr_arg){
	if surface_exists(global.overlay_surf){
		surface_set_target(global.overlay_surf)
		
		script_execute_ext(draw_scr,scr_arg)
		
		surface_reset_target()
	}
}

function draw_text_hover(txt,background,txt_c,halign){
	var txt_color = txt_c == undefined ? c_white : txt_c
	var txt_halign = halign  == undefined ? fa_left : halign
	
	var element_txt = scribble(txt)
	element_txt.starting_format("fnt_small",txt_color)
	element_txt.align(txt_halign,fa_top)
	element_txt.wrap(300)
	var over_hint_width = element_txt.get_width()+11
	var over_hint_height = element_txt.get_height()+12
	var over_hint_x = 0, over_hint_y = 0
	over_hint_x = clamp(over_hint_x,device_mouse_x_to_gui(0)+20,GUIWIDTH-over_hint_width)
	over_hint_y = clamp(over_hint_y,device_mouse_y_to_gui(0),GUIHEIGHT-over_hint_height)
	draw_sprite_stretched(background,0,over_hint_x,over_hint_y,over_hint_width,over_hint_height)
	element_txt.draw(over_hint_x+(round(over_hint_width/2)),over_hint_y)
}