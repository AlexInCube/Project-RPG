///@description General in-game controller for getting keyboard input, checking window
//crossing, draw HUD buttons, loading game, interacting with game objects.
#macro INTERACT "interact"//Macro for asset tag
/* Day/night cycle */
#macro PHASE_TYPE_NIGHT 0
#macro PHASE_TYPE_SUNRISE 1
#macro PHASE_TYPE_DAY 2
#macro PHASE_TYPE_SUNSET 3
depth=-99999999
//Getting input
get_input()
//Story tags
story_tags = ds_list_create()
//World time (day and night cycle)
seconds = 0
minutes = 0 
hours = 0

time_increment = 100
day = 0

max_darkness = 0.7
darkness = 0
light_colour = c_white
time_is_go = true

enum phase{
	sunrise = 6,
	daytime = 8.5,
	sunset = 18,
	nighttime = 22
}

global.day_phase = PHASE_TYPE_NIGHT
//Overlay surface
overall_gui_surf = surface_create(GUIWIDTH,GUIHEIGHT)//Draw something over all

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

room_data = "" //for autosaving
previous_room = room