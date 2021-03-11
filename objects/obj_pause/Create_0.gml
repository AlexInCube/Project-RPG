instance_deactivate_all(true)
instance_activate_object(obj_debug)
instance_activate_object(obj_eventmanager)
instance_activate_object(sentry_handler)
audio_pause_all()

menustate = menu_state.main_buttons

var button_x = (GUIWIDTH/2)-(sprite_get_width(spr_buttonmenu)/2)
ds_menu_main = create_ui_elements_list(
	create_fancy_button(button_x,100,spr_buttonmenu,depth-1,find_keyword("resume_game"),resume_game),
	create_fancy_button(button_x,143,spr_buttonmenu,depth-1,find_keyword("select_save"),open_save_window),
	create_fancy_button(button_x,186,spr_buttonmenu,depth-1,find_keyword("settings"),open_settings),
	create_fancy_button(button_x,229,spr_buttonmenu,depth-1,find_keyword("back_to_main_menu"),exit_to_main_menu),
	create_fancy_button(button_x,272,spr_buttonmenu,depth-1,find_keyword("exit_to_desktop"),show_exit_question),
)

background = -1