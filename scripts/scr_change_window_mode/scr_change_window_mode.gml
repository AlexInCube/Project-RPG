switch(argument0)
{
	case 0: global.fullscreen=false; window_set_fullscreen(false) break;
	case 1: global.fullscreen=true; window_set_fullscreen(true) break;
}