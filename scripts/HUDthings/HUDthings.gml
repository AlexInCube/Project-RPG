function draw_button_hint(x,y,button_control){
	var normal_word = return_normal_control_word(button_control)
	var x2 = x+max(string_width(normal_word)+10,20)
	var y2 = y+20
	draw_rectangle_color_fast(x+2,y+2,x2+2,y2+2,c_black,false)
	draw_rectangle_color_fast(x,y,x2,y2,c_gray,false)
	draw_rectangle_color_fast(x,y,x2,y2,c_black,true)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_text_shadow(x+11,y+10,normal_word,fnt_small,1,c_black,c_white,1)
}