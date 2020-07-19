var ds_grid = ds_menu_main
for(i=0;i<ds_menu_height;i++){
	switch(ds_grid[# 1,i]){
		case menu_element_type.button:
			var colordiff = 50*ceil(ds_grid[# 2,i])
			var c = make_color_rgb(255-colordiff,255-colordiff,255-colordiff)
			var button_x = 50;var button_y = 100+(43*i)

			if scr_mouseover(button_x,button_y,button_x+button_width,button_y+button_height){
				ds_grid[# 2,i]+=0.5
				if mouse_check_button_pressed(mb_left){
					script_execute(ds_grid[# 3,i])
				}
			}else{
				ds_grid[# 2,i]-=0.5
			}
			ds_grid[# 2,i]=clamp(ds_grid[# 2,i],0,sprite_get_number(button_sprite)-1)
			draw_set_halign(fa_left)
			draw_set_valign(fa_top)
			draw_sprite(button_sprite,ds_grid[# 2,i],button_x,button_y)
			draw_set_halign(fa_center)
			draw_set_valign(fa_middle)
			draw_text_color(button_x+button_width/2,button_y+button_height/2,ds_grid[# 0,i],c,c,c,c,1)
		break;
	}

}