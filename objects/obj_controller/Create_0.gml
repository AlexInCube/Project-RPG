scr_get_input()
window_list=ds_list_create()
previous_room=room
fpsbuffer=0
cheat=""
followcamera=obj_player
psb=0//pause screen buffer
exittomenu=false
#macro GUIWIDTH global.guiwidth
#macro GUIHEIGHT global.guiheight
GUIWIDTH=display_get_gui_width()
GUIHEIGHT=display_get_gui_height()