event_inherited()
light_state = 0
interact_radius = 64
function interact(){
	obj_controller.interact_key = 0
	pause_game()
	open_save_window(true)
	obj_pause.menustate = menu_state.window_load_save
}