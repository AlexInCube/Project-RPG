// Inherit the parent event
ds_grid_destroy(ds_options)
destroy_ui_elements_list(ds_options_ui_elements)

if instance_exists(obj_mainmenucontroller){
	with(obj_mainmenucontroller){
		menustate=menu_state.main_buttons
	}
	//Needed for recreating pause menu, because after resolution changing, buttons are missaligned.
	with(obj_pause){
		resume_game()
		pause_game()
	}
}
