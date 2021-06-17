function draw_button_hint(x,y,button_control){
	var normal_word = return_normal_control_word(button_control)
	draw_text_shadow(x+11,y+10,normal_word,fnt_small,1,c_black,c_white,1)
}