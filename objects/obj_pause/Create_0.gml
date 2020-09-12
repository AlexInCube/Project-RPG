instance_deactivate_all(true)
instance_activate_object(obj_debug)
instance_activate_object(obj_eventmanager)
audio_pause_all()

menustate = menu_state.main_buttons

ds_menu_main = create_menu_page(
	[find_keyword("resume_game"),		menu_element_type.button, 0, unpause_game],
	[find_keyword("fast_save_game"),	menu_element_type.button, 0, save_game],
	[find_keyword("save_or_load_game"),	menu_element_type.button, 0, select_slot],
	[find_keyword("settings"),			menu_element_type.button, 0, open_settings],
	[find_keyword("back_to_main_menu"),	menu_element_type.button, 0, exit_to_main_menu],
	[find_keyword("exit_to_desktop"),	menu_element_type.button, 0, game_exit]
)

ds_menu_height = ds_grid_height(ds_menu_main)
button_sprite = spr_buttonmenu
button_width = sprite_get_width(button_sprite)
button_height = sprite_get_height(button_sprite)
button_x = (GUIWIDTH/2)-(button_width/2)