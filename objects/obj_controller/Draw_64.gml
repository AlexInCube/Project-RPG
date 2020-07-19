/// @description Draw Debug Info
//Draw pause menu background
if room = room_pause
{
	draw_sprite_stretched(psb,0,0,0,GUIWIDTH,GUIHEIGHT)
	exit
}

//Draw HUD buttons
scr_draw_button(GUIWIDTH/2-200,GUIHEIGHT-36,GUIWIDTH/2-168,GUIHEIGHT,spr_backpack,scr_open_inventory)//Open inventory window
scr_draw_button(GUIWIDTH/2-235,GUIHEIGHT-36,GUIWIDTH/2-202,GUIHEIGHT,spr_map,nothing)//Open map
scr_draw_button(GUIWIDTH/2+165,GUIHEIGHT-36,GUIWIDTH/2+197,GUIHEIGHT,spr_settings,nothing)//Open settings (maybe pause menu later)
scr_draw_button(GUIWIDTH/2+200,GUIHEIGHT-36,GUIWIDTH/2+232,GUIHEIGHT,spr_craft,nothing)//Open craft window

//Draw FPS
draw_set_halign(fa_left)
draw_set_valign(fa_left)
draw_set_color(c_white)
draw_set_font(fnt_small)
draw_text(GUIWIDTH - 110,5,"Fps:"+string(round(fps_real)))

/*
draw_text(40,100,"Resolution set in game:"+string(global.width)+"x"+string(global.height))
draw_text(40,125,"GUI resolution:"+string(display_get_gui_width())+"x"+string(display_get_gui_height()))
draw_text(40,175,"Camera viewport:"+string(camera_get_view_width(view))+"x"+string(camera_get_view_height(view)))
draw_text(40,200,"Surface size:"+string(surface_get_width(application_surface))+"x"+string(surface_get_height(application_surface)))
*/
