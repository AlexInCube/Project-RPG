if !debugmode{exit}
//Draw FPS
draw_set_halign(fa_left)
draw_set_valign(fa_left)
draw_set_color(c_red)
draw_set_font(fnt_small)

draw_text(40,100,"Resolution set in game:"+string(global.width)+"x"+string(global.height))
draw_text(40,125,"GUI resolution:"+string(display_get_gui_width())+"x"+string(display_get_gui_height()))
draw_text(40,150,"GUI scale:"+string(global.guisize))
draw_text(40,175,"Camera viewport:"+string(camera_get_view_width(view))+"x"+string(camera_get_view_height(view)))
draw_text(40,200,"Surface size:"+string(surface_get_width(application_surface))+"x"+string(surface_get_height(application_surface)))
