switch(current_transition){
	case transition.fade_in: 
		draw_set_alpha(fade)
		draw_rectangle_color_fast(0,0,GUIWIDTH,GUIHEIGHT,c_black,false)
		draw_set_alpha(1)
	break
	case transition.fade_out: 
		draw_set_alpha(fade)
		draw_rectangle_color_fast(0,0,GUIWIDTH,GUIHEIGHT,c_black,false)
		draw_set_alpha(1)
	break
}
