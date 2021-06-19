if !active_screen exit

draw_set_alpha(0.7)
draw_rectangle_color_fast(0,0,GUIWIDTH,GUIHEIGHT,c_black,false)
draw_set_alpha(1)

//Draw name of current screen
draw_set_halign(fa_center)
draw_set_valign(fa_bottom)
draw_text_shadow(GUIWIDTH/2,buttons_screen_start_y+5,screen_map[? current_screen][$ "screen_name"],fnt_large,2,c_black,c_white,1)
//Draw screen selection buttons
for(var i = 0;i<array_length(buttons_order);i++){
	var xx = buttons_screen_start_x+(i*(buttons_screen_width+buttons_screen_offset_x))
	var yy = buttons_screen_start_y
	draw_sprite(screen_map[? buttons_order[i]][$ "screen_icon"],0,xx,yy)
	
	if mouseover(xx,yy,xx+buttons_screen_width,yy+buttons_screen_height){
		if mouse_check_button_pressed(mb_left){
			instance_destroy(par_screen)
			current_screen = buttons_order[i]
			create_screen_obj(current_screen)
		}
	}
}
//Draw divide line
draw_set_color(c_white)
draw_line(0,line_y,GUIWIDTH,line_y)