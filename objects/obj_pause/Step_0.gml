if keyboard_check_pressed(global.settings.controls.pause_key)
{
	if menustate == menu_state.main_buttons
	{
		resume_game()
		exit
	}
}

event_inherited()

