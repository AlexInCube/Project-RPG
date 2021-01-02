instance_deactivate_all(true)
instance_activate_object(obj_debug)
instance_activate_object(obj_eventmanager)
audio_pause_all()

menustate = menu_state.main_buttons

var button_x = (GUIWIDTH/2)-(sprite_get_width(spr_death_screen_button)/2)
ds_menu_main = create_ui_elements_list(
	create_button(button_x,100,spr_death_screen_button,depth-1,find_keyword("load_last_save"),resume_game),
	create_button(button_x,143,spr_death_screen_button,depth-1,find_keyword("select_save"),open_save_window),
	create_button(button_x,229,spr_death_screen_button,depth-1,find_keyword("back_to_main_menu"),exit_to_main_menu),
	create_button(button_x,272,spr_death_screen_button,depth-1,find_keyword("rage_quit"),show_exit_question),
)

cursor_sprite=spr_cursor
window_set_cursor(cr_none)

killer=""
you_died_word=find_keyword("you_has_been_killed_by")