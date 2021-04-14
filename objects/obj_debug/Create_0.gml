#macro DEBUGMODE global.debugmode
#macro DELTATIME global.delta_multiplier
#macro LOGGER_SAVE_MANAGER "[ Save Manager ] "
#macro LOGGER_EVENT_MANAGER "[ Event Manager ] "
#macro LOGGER_LOCALIZATION_MANAGER "[ Localization Manager ] "
#macro LOGGER_SPELL_MANAGER "[ Spell Manager ] "

target_delta = 1/60//Default game speed
actual_delta = delta_time/1000000//Delta in seconds
global.delta_multiplier = actual_delta/target_delta//delta_multiplier*speed

global.debugmode=false

//Overlay surface
global.overlay_surf = surface_create(GUIWIDTH,GUIHEIGHT)//Draw something over all