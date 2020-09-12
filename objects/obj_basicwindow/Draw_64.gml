//Draw window background

if window_sprite == spr_basicwindow{
draw_nine_slice_box(window_sprite,window_x,window_y,window_x+window_width,window_y+window_height,0)
}else{
draw_sprite(window_sprite,0,window_x,window_y)
}
//Draw window name
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_white)
draw_set_font(fnt_small)
//draw_text(window_x+7,window_y,window_name+string(depth)+"  "+string(placefree)+"  "+string(mouseover))
draw_text(window_x+7,window_y,window_name)
//Draw screen
if guiscreen!=undefined{
	script_execute_alt(guiscreen,guiscreenarg)
}

//For visual debugging
/*
if placefree{draw_rectangle_color(window_x,window_y,window_x+window_width,window_y+window_height,c_green,c_green,c_green,c_green,true)}else{
draw_rectangle_color(window_x,window_y,window_x+window_width,window_y+window_height,c_red,c_red,c_red,c_red,true)}