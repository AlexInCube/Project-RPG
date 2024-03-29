///@description General in-game controller for getting keyboard input, checking window
//crossing, draw HUD buttons, loading game, interacting with game objects.
#macro INTERACT "interact"//Macro for asset tag
/* Day/night cycle */
#macro PHASE_TYPE_NIGHT 0
#macro PHASE_TYPE_SUNRISE 1
#macro PHASE_TYPE_DAY 2
#macro PHASE_TYPE_SUNSET 3
depth=-99999999
//World time (day and night cycle)
seconds = 0
minutes = 0 
hours = 20
day = 0
time_increment = 1//Increase this if we want speed up time
time_is_go = true//If we need stop the time
enum phase{
	sunrise = 6,
	daytime = 8.5,
	sunset = 18,
	nighttime = 22
}

global.day_phase = PHASE_TYPE_NIGHT
max_darkness = 0.7
darkness = 0//Light Surface Alpha
light_colour = c_white


cur_story_tags = ds_list_create()//Tags about story

global.interface_lock_by_game = false//Turning on/off interface if game want it


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

craft_button_x = 110
craft_button_name = "crafting"
//for autosaving
room_data = "" 
previous_room = room


///@description draw_button_hud(x,y,x2,y2,sprite,script)
///@arg x
///@arg y
///@arg sprite
///@arg button_name
///@arg script
function draw_button_hud(xx,yy,sprite,name,script) {
	var subimage = 0
	
	if mouseover(xx,yy,xx+36,yy+36)
	{
		subimage = 1
		if mouse_check_button_pressed(mb_left)
		{
			script_execute(script)
		}
	}else subimage = 0

	draw_sprite(sprite,subimage,xx,yy)
}