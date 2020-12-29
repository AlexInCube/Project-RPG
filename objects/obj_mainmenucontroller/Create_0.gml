enum menu_element_type{
	button,
	empty_space,
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
	//Localization word				//Menu element type		//Button animation	//Function
	[find_keyword("continue_game")+"     "+global.lastsave,	menu_element_type.button, 0, load_last_player_save],
	[find_keyword("start_game"),	menu_element_type.button, 0, game_start],
	[find_keyword("select_save"),	menu_element_type.button, 0, open_save_window],
	[find_keyword("settings"),		menu_element_type.button, 0, open_settings],
	[find_keyword("creators"),		menu_element_type.button, 0, open_creators],
	[find_keyword("exit"),			menu_element_type.button, 0, show_exit_question]
)

if !file_exists("Saves\\"+global.lastsave+"/playerdata.txt"){
	ds_grid_set_region(ds_menu_main,0,0,3,0,-1)
}

ds_menu_height = ds_grid_height(ds_menu_main)
button_sprite = spr_buttonmenu
button_width = sprite_get_width(button_sprite)
button_height = sprite_get_height(button_sprite)
button_x = 50
button_yy = 100
