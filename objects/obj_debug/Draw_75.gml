if surface_exists(global.overlay_surf){
	draw_surface(global.overlay_surf,0,0)
	surface_set_target(global.overlay_surf)
	draw_clear_alpha(c_white,0)
	surface_reset_target()
}else{
	global.overlay_surf = surface_create(GUIWIDTH,GUIHEIGHT)
}


if !DEBUGMODE{exit}
//Draw FPS
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_red)
draw_set_font(fnt_verysmall)
var c = c_black
draw_rectangle_color(0,5,200,150,c,c,c,c,false)
draw_text(5,10,"Resolution set in game:"+string(global.settings.video.width)+"x"+string(global.settings.video.height))
draw_text(5,20,"GUI resolution:"+string(GUIWIDTH)+"x"+string(GUIHEIGHT)+" GUI scale:"+string(global.settings.interface.guisize))
draw_text(5,30,"Camera viewport:"+string(camera_get_view_width(camera))+"x"+string(camera_get_view_height(camera)))
draw_text(5,40,"Surface size:"+string(surface_get_width(application_surface))+"x"+string(surface_get_height(application_surface)))
draw_text(5,50,"Window w/h:"+string(window_get_width())+"x"+string(window_get_height()))
draw_text(5,60,"Fps:"+string(fps)+ " Game Speed:"+string(room_speed)+" Fps Limit:"+string(global.settings.video.game_speed))
draw_text(5,70,"Anti-aliasing:"+string(display_aa)+ "VSync:"+string(global.settings.video.v_sync))
draw_text(5,80,"DeltaMultiplier:"+string(DELTATIME))
draw_text(5,90,"DirSave:"+string(global.directory_save)+" LastSave:"+string(global.lastsave))
/*
if instance_exists(obj_camera){
draw_text(5,70,"Camera Speed:"+string(obj_camera.camera_speed))

}
