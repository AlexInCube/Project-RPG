draw_black_screen()
draw_set_color(c_white)
draw_set_font(fnt_small)
draw_set_halign(fa_middle)
draw_set_valign(fa_center)
draw_sprite_stretched(window_sprite,0,window_x,window_y,window_width,window_height)
draw_text_ext(window_x+window_width/2,window_y+12,write_save_name,-1,window_width)

draw_set_color(c_yellow)
draw_text_ext(window_x+window_width/2,window_y+35,warning_message,-1,window_width)