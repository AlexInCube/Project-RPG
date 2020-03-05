/// @description Draw Debug Info
if room = room_pause
{
	draw_sprite_stretched(psb,0,0,0,display_get_gui_width(),display_get_gui_height())
}
/*
draw_set_halign(fa_left)
draw_set_valign(fa_left)
draw_set_color(c_white)

if alarm[0]=-1 and fps_real>1{
fpsbuffer = fps_real
alarm[0]=room_speed/5
}
if fpsbuffer>1{
draw_text(40,150,"Fps Real:"+string(fpsbuffer))
}

draw_text(40,100,"Resolution set in game:"+string(global.width)+"x"+string(global.height))
draw_text(40,125,"GUI resolution:"+string(display_get_gui_width())+"x"+string(display_get_gui_height()))
draw_text(40,175,"Camera viewport:"+string(camera_get_view_width(view))+"x"+string(camera_get_view_height(view)))
draw_text(40,200,"Surface size:"+string(surface_get_width(application_surface))+"x"+string(surface_get_height(application_surface)))
