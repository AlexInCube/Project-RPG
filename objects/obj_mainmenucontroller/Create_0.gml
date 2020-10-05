enum menu_element_type{
	button
}

//Switching main menu/pause menu UI state
enum menu_state{
	main_buttons,
	options,
	window_load_save
}

menustate = menu_state.main_buttons

//Button second argument is array for button state and txt color
ds_menu_main = create_menu_page(
	[find_keyword("start_game"),	menu_element_type.button, 0, game_start],
	[find_keyword("continue_game"),	menu_element_type.button, 0, select_slot],
	[find_keyword("settings"),		menu_element_type.button, 0, open_settings],
	[find_keyword("creators"),		menu_element_type.button, 0, nothing],
	[find_keyword("exit"),			menu_element_type.button, 0, game_exit]
)

ds_menu_height = ds_grid_height(ds_menu_main)
button_sprite = spr_buttonmenu
button_width = sprite_get_width(button_sprite)
button_height = sprite_get_height(button_sprite)
button_x = 50

