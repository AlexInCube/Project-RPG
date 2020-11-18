if !ds_exists(ds_menu_main,ds_type_grid) or menustate != menu_state.main_buttons exit
var ds_grid = ds_menu_main
draw_set_font(fnt_small)
for(i=0;i<ds_menu_height;i++){
	switch(ds_grid[# 1,i]){
		case menu_element_type.button:
			var colordiff = 50*ceil(ds_grid[# 2,i])
			var c = make_color_rgb(255-colordiff,255-colordiff,255-colordiff)
			var button_y = button_yy+(43*i)
			
				if mouseover(button_x,button_y,button_x+button_width,button_y+button_height){
					ds_grid[# 2,i]+=0.5
					if mouse_check_button_pressed(mb_left){
						script_execute(ds_grid[# 3,i])
					}
				}else{
					ds_grid[# 2,i]-=0.5
				}
			if !ds_exists(ds_menu_main,ds_type_grid) exit
			ds_grid[# 2,i]=clamp(ds_grid[# 2,i],0,sprite_get_number(button_sprite)-1)
			draw_set_halign(fa_left)
			draw_set_valign(fa_top)
			draw_sprite(button_sprite,ds_grid[# 2,i],button_x,button_y)
			draw_set_halign(fa_center)
			draw_set_valign(fa_middle)
			if string_width(ds_grid[# 0,i]) < button_width - 10{
			draw_text_color(button_x+button_width/2,button_y+button_height/2,ds_grid[# 0,i],c,c,c,c,1)
			}else{
			draw_text_ext_color(button_x+button_width/2,button_y+button_height/2-5,ds_grid[# 0,i],16,button_width-5,c,c,c,c,1)
			}
		break;
		
		case menu_element_type.empty_space:
			continue
		break
	}

}

if room == room_main{
draw_sprite(spr_logo,0,40,0)
}

