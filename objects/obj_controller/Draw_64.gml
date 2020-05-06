/// @description Draw Debug Info
if room = room_pause
{
	draw_sprite_stretched(psb,0,0,0,global.guiwidth,global.guiheight)
	exit
}

scr_draw_button(global.guiwidth/2-200,global.guiheight-36,global.guiwidth/2-168,global.guiheight,spr_backpack,scr_open_inventory)
scr_draw_button(global.guiwidth/2-235,global.guiheight-36,global.guiwidth/2-202,global.guiheight,spr_map,nothing)
scr_draw_button(global.guiwidth/2+165,global.guiheight-36,global.guiwidth/2+197,global.guiheight,spr_settings,nothing)
scr_draw_button(global.guiwidth/2+200,global.guiheight-36,global.guiwidth/2+232,global.guiheight,spr_craft,nothing)


draw_set_halign(fa_left)
draw_set_valign(fa_left)
draw_set_color(c_white)

if alarm[0]=-1 and fps_real>1{
fpsbuffer = fps_real
alarm[0]=room_speed/5
}
if fpsbuffer>1{
draw_text(GUIWIDTH - 110,5,"Fps:"+string(round(fpsbuffer)))
}
/*
draw_text(40,100,"Resolution set in game:"+string(global.width)+"x"+string(global.height))
draw_text(40,125,"GUI resolution:"+string(display_get_gui_width())+"x"+string(display_get_gui_height()))
draw_text(40,175,"Camera viewport:"+string(camera_get_view_width(view))+"x"+string(camera_get_view_height(view)))
draw_text(40,200,"Surface size:"+string(surface_get_width(application_surface))+"x"+string(surface_get_height(application_surface)))
*/
