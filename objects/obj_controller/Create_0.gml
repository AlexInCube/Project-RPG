scr_get_input()//Set/get input from player 
window_list=ds_list_create()//For window system

previous_room=room//For pause menu
cheat=""//For "console" f5
followcamera=obj_player//Camera target
psb=0//pause screen buffer (background for pause menu)
exittomenu=false//if player want go to main menu, we go to previous room and off persistent for all objects

GUIWIDTH=display_get_gui_width()
GUIHEIGHT=display_get_gui_height()