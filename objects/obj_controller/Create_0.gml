///@description General in-game controller for getting keyboard input, checking window
//crossing, draw HUD buttons, loading game, interacting with game objects.
#macro INTERACT "interact"//Macro for asset tag

get_input()//Set/get input from player
overall_gui_surf = surface_create(GUIWIDTH,GUIHEIGHT)//For item description

depth=-99999999

//Windows ID
inventorywindow=noone
inventory_window_x=0
inventory_window_y=0
equipmentwindow=noone
equipment_window_x=0
equipment_window_y=140
questlistwindow=noone
questlist_window_x=(GUIWIDTH/2)-450/2
questlist_window_y=(GUIHEIGHT/2)-300/2