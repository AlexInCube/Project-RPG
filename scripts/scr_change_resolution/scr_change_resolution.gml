switch(argument0){
	case 0: global.width=1280;global.height=720; break;
	case 1: global.width=1536;global.height=834;break;
	case 2: global.width=1920;global.height=1080;break;
}
window_set_size(global.width,global.height)
scr_change_gui_size(global.guisize)
surface_resize(application_surface,global.width,global.height);
alarm[0]=1
