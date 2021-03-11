with(obj_optionswindow)instance_destroy()
with(obj_save_or_load_window)instance_destroy()
if surface_exists(background){
	surface_free(background)
}
event_inherited()
instance_activate_all()