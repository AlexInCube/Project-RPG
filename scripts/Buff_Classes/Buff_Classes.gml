#macro EFFECT_SCRIPT_CREATE "effect_create_script"
#macro EFFECT_SCRIPT_TICK "effect_tick_script"
#macro EFFECT_SCRIPT_DRAWING "effect_draw_script"
#macro EFFECT_SCRIPT_DESTROY "effect_destroy_script"
#macro EFFECT_TICKTIMER "effect_tick_timer"

#macro EFFECT_MULTIPLE "effect_multiple"
#macro EFFECT_IS_BUFF "effect_is_buff"
#macro EFFECT_HIDE_ICON "effect_hide_icon"



function default_effect() constructor{
	effect_unlocale_name = ""//Effect ID
	effect_locale_name = find_keyword(effect_unlocale_name)//Effect localized name for player
	effect_description = find_keyword(effect_unlocale_name+"_description")//Description for player
	effect_icon = spr_effect_frame//Effect Sprite on buff bar
	effect_is_buff = true//Effect type, for effect frame.
	effect_arg_array = []
	effect_create_script = nothing//Script execute when effect applied to lifeform
	effect_tick_script = nothing//Script executing when tick done
	effect_tick_timer = 60//Countdown for script executing, when timer == 0, then execute effect_tick_script
	effect_multiple = false//Can buff multiplied with the same buffs?
	effect_hide_icon = false//Hide icon from buff bar?
	effect_draw_script = nothing//Effect drawing
	effect_destroy_script = nothing//Executing when effect duration = 0
	effect_priority = 0//Priority of effect drawing
	effect_nbt = {//Special struct for every effect
		duration : convert_seconds_to_ticks(1)
	}
}

function regeneration_effect() : default_effect() constructor{
	effect_is_buff = true
	effect_create_script = function(){
		show_debug_message("effect created heal")
	}
	effect_tick_script = function(){
		heal(1,obj_player_stats,false)
		show_debug_message("healed")
	}
	effect_nbt = {
		duration : convert_seconds_to_ticks(3)
	}
}

function attack_effect() : default_effect() constructor{
	effect_is_buff = false
	effect_create_script = function(){
		show_debug_message("effect created attack")
	}
	effect_tick_script = function(){
	}
	effect_destroy_script = function(){
		show_debug_message("effect destroyed attack")
	}
	effect_nbt = {
		duration : convert_seconds_to_ticks(5)
	}
}

