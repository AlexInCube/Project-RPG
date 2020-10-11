// Inherit the parent event
ds_grid_destroy(ds_options)
if instance_exists(obj_mainmenucontroller){
	with(obj_mainmenucontroller){
		menustate=menu_state.main_buttons
	}
}
