#macro DEBUGMODE global.debugmode
#macro DELTATIME global.delta_multiplier
global.debugmode=false

target_delta = 1/60//Default game speed
actual_delta = delta_time/1000000//Delta in seconds
global.delta_multiplier = actual_delta/target_delta//delta_multiplier*speed