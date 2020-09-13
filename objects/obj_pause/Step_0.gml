button_x = (GUIWIDTH/2)-(button_width/2)

if keyboard_check_pressed(global.pause_key)
{
	if menustate == menu_state.main_buttons
	{
		unpause_game()
	}
}

