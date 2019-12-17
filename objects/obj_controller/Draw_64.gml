/// @description Insert description here
// You can write your code in this editor
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
/*
draw_text(40,100,"Resolution set in game:"+string(global.width)+"x"+string(global.height))
draw_text(40,125,"GUI resolution:"+string(display_get_gui_width())+"x"+string(display_get_gui_height()))
draw_text(40,150,"Display mouse coord:"+string(display_mouse_get_x())+" "+string(display_mouse_get_y()))
draw_text(40,175,"Device mouse coord:"+string(device_mouse_x_to_gui(0))+" "+string(device_mouse_y_to_gui(0)))