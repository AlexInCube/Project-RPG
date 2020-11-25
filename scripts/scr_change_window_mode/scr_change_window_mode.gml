function change_window_mode(argument0) {
	global.settings.video.fullscreen=argument0
	window_set_fullscreen(global.settings.video.fullscreen)
	
	window_set_size(global.settings.video.width,global.settings.video.height)
	change_gui_size(global.settings.interface.guisize)
	surface_resize(application_surface,global.settings.video.width,global.settings.video.height);
}
