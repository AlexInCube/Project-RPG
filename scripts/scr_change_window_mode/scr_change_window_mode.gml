switch(argument0)
{
	case 0: global.fullscreen=false; window_set_fullscreen(global.fullscreen) break;
	case 1: global.fullscreen=true; window_set_fullscreen(global.fullscreen) break;
}
window_set_size(global.width,global.height)
scr_change_gui_size(global.guisize)
surface_resize(application_surface,global.width,global.height);