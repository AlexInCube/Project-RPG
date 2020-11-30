if !DEBUGMODE{exit}
//Draw FPS
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_red)
draw_set_font(fnt_verysmall)
var c = c_black
draw_rectangle_color(0,5,200,75,c,c,c,c,false)
draw_text(5,10,"Resolution set in game:"+string(global.settings.video.width)+"x"+string(global.settings.video.height))
draw_text(5,20,"GUI resolution:"+string(display_get_gui_width())+"x"+string(display_get_gui_height())+" GUI scale:"+string(global.settings.interface.guisize))
draw_text(5,30,"Camera viewport:"+string(camera_get_view_width(camera))+"x"+string(camera_get_view_height(camera)))
draw_text(5,40,"Surface size:"+string(surface_get_width(application_surface))+"x"+string(surface_get_height(application_surface)))
draw_text(5,50,"Window w/h:"+string(window_get_width())+"x"+string(window_get_height()))
if instance_exists(obj_camera){
draw_text(5,60,"Camera Speed:"+string(obj_camera.camera_speed))

}
