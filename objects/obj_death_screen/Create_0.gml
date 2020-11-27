instance_deactivate_all(true)
instance_activate_object(obj_debug)
instance_activate_object(obj_eventmanager)
audio_pause_all()

menustate = menu_state.main_buttons

ds_menu_main = create_menu_page(
	[find_keyword("load_last_save"),	menu_element_type.button, 0, load_last_player_save],
	[0,menu_element_type.empty_space,0],
	[find_keyword("select_save"),	menu_element_type.button, 0, open_save_window],
	[0,menu_element_type.empty_space,0],
	[find_keyword("back_to_main_menu"),	menu_element_type.button, 0, exit_to_main_menu],
	[find_keyword("exit_to_desktop"),	menu_element_type.button, 0, game_exit]
)

ds_menu_height = ds_grid_height(ds_menu_main)
button_sprite = spr_death_screen_button
button_width = sprite_get_width(button_sprite)
button_height = sprite_get_height(button_sprite)
button_x = (GUIWIDTH/2)-(button_width/2)
button_yy = 100


cursor_sprite=spr_cursor
window_set_cursor(cr_none)

killer=""
you_died_word=find_keyword("you_has_been_killed_by")