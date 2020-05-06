//Draw window background
if window_sprite == spr_basicwindow{
scr_draw_nine_slice_box(window_sprite,window_x,window_y,window_x+window_width,window_y+window_height)
}else{
draw_sprite(window_sprite,0,window_x,window_y)
}
//Draw window name
draw_set_halign(fa_left)
draw_set_color(c_white)
draw_set_font(fnt_small)
draw_text(window_x+7,window_y,window_name+string(depth)+"  "+string(placefree))
//Draw screen
if guiscreen!=undefined{
	scr_script_execute_alt(guiscreen,guiscreenarg)
}