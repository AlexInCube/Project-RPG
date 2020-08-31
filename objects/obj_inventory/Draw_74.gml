if surface_exists(drawitemtooltip){
surface_set_target(drawitemtooltip)
draw_clear_alpha(c_black, 0);
surface_reset_target()
}else{
drawitemtooltip = surface_create(GUIWIDTH,GUIHEIGHT)
}