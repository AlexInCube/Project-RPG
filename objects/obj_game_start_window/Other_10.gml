var button_spr = spr_buttonmenu
var button_width = sprite_get_width(button_spr)
var button_height = sprite_get_height(button_spr)
var txt_box_width = 200

ds_elements = create_ui_elements_list(
	create_fancy_button_draw_end(window_x,window_y+window_height-button_height,spr_buttonmenu,depth-1,answer_yes,method_get_index(check_save_files)),
	create_fancy_button_draw_end(window_x+window_width-button_width,window_y+window_height-button_height,spr_buttonmenu,depth-1,answer_no,method_get_index(destroy_me)),
	create_textbox(window_x+(window_width/2)-txt_box_width/2,window_y+50,depth-1,txt_box_width,25,20,true)
)