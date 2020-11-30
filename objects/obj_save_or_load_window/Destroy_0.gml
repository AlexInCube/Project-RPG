if ds_exists(ds_saves,ds_type_list){
ds_list_destroy(ds_saves)
}
if instance_exists(obj_mainmenucontroller){
	with(obj_mainmenucontroller){
		menustate=menu_state.main_buttons
	}
}

