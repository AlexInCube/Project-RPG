#macro DEBUGMODE global.debugmode
#macro DELTATIME global.delta_multiplier
#macro LOGGER_SAVE_MANAGER "[ Save Manager ] "
#macro LOGGER_EVENT_HANDLER "[ Event Handler ] "
#macro LOGGER_LOCALIZATION_MANAGER "[ Localization ] "
#macro LOGGER_SPELL_MANAGER "[ Spell Manager ] "

target_delta = 60//Default game speed
actual_delta = delta_time/1000000//Delta in seconds
global.delta_multiplier = 1//actual_delta/target_delta

global.debugmode=false

//Overlay surface
global.overlay_surf = surface_create(GUIWIDTH,GUIHEIGHT)//Draw something overlay