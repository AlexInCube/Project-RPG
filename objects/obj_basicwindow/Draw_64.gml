//Draw window background
draw_sprite_stretched(window_sprite,0,window_x,window_y,window_width,window_height)
//Draw window name
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_white)
draw_set_font(fnt_small)
//draw_text(window_x+7,window_y,window_name+string(depth)+"  "+string(placefree)+"  "+string(mouseover))
draw_text(window_x+7,window_y,window_name)

//For visual debugging
/*
if placefree{draw_rectangle_color(window_x,window_y,window_x+window_width,window_y+window_height,c_green,c_green,c_green,c_green,true)}else{
draw_rectangle_color(window_x,window_y,window_x+window_width,window_y+window_height,c_red,c_red,c_red,c_red,true)}