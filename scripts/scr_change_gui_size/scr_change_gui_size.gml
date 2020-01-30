camera_set_view_size(view_camera[0],global.width,global.height);
surface_resize(application_surface, global.width, global.height);

switch(argument0){
	case 0: global.guisize=0;display_set_gui_size(global.width, global.height)  break;
	case 1: global.guisize=1;display_set_gui_size(1280, 720)  break;
	case 2: global.guisize=2;display_set_gui_size(960, 540)  break;
}


