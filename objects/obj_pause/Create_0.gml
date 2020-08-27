instance_deactivate_all(true)
instance_activate_object(obj_debug)
audio_pause_all()

ds_menu_main = scr_create_menu_page(
	[scr_find_keyword("resume_game"),		menu_element_type.button, 0, unpause_game],
	[scr_find_keyword("save_game"),			menu_element_type.button, 0, nothing],
	[scr_find_keyword("load_game"),			menu_element_type.button, 0, nothing],
	[scr_find_keyword("settings"),			menu_element_type.button, 0, scr_open_settings],
	[scr_find_keyword("back_to_main_menu"),	menu_element_type.button, 0, exit_to_main_menu],
	[scr_find_keyword("exit_to_desktop"),	menu_element_type.button, 0, scr_game_exit]
)

ds_menu_height = ds_grid_height(ds_menu_main)
button_sprite = spr_buttonmenu
button_width = sprite_get_width(button_sprite)
button_height = sprite_get_height(button_sprite)
button_x = (GUIWIDTH/2)-(button_width/2)