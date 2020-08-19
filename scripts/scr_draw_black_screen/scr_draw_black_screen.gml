function scr_draw_black_screen() {
	draw_set_alpha(0.5)
	draw_set_color(c_black)
	draw_rectangle(0,0,global.width,global.height,false)
	draw_set_alpha(1)


}
