actual_delta = delta_time/1000000//Delta in seconds
global.delta_multiplier = target_delta/global.settings.video.game_speed///actual_delta/target_delta
game_set_speed(global.settings.video.game_speed,gamespeed_fps)

if keyboard_check_pressed(global.settings.controls.developer_key){
	DEBUGMODE = !DEBUGMODE
	var visibility = DEBUGMODE
	show_debug_overlay(DEBUGMODE)

	with(obj_trigger)visible = visibility
	with(obj_cutscene_trigger)visible = visibility
	with(obj_door)visible = visibility
	with(obj_mob_spawner)visible = visibility
}