/// @description Draw Buttons
//Draw HUD buttons
if instance_exists(obj_textbox) exit
if global.interface_lock_by_game {exit}

draw_set_alpha(1)

draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_text_shadow(GUIWIDTH-50,5,string(get_formatted_date(hours))+":"+string(get_formatted_date(minutes)),fnt_small,1,c_black,c_white,1)