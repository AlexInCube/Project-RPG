#macro EFFECT_SCRIPT_CREATE "effect_create"
#macro EFFECT_SCRIPT_TICK "effect_tick_script"
#macro EFFECT_SCRIPT_DRAWING "effect_draw_script"
#macro EFFECT_SCRIPT_DESTROY "effect_destroy_script"

#macro EFFECT_TYPE_BUFF 1
#macro EFFECT_TYPE_DEBUFF 0
#macro EFFECT_NOT_MULTIPLE false
#macro EFFECT_MULTIPLE true

function default_effect() constructor{
	effect_unlocale_name = ""//Effect ID
	effect_locale_name = find_keyword(effect_unlocale_name)//Effect localized name for player
	effect_description = find_keyword(effect_unlocale_name+"_description")//Description for player
	effect_icon = spr_effect_frame//Effect Sprite on buff bar
	effect_type = EFFECT_TYPE_BUFF//Effect type, for effect frame.
	effect_arg_array = []
	effect_create = nothing//Script execute when effect applied to lifeform
	effect_tick_script = nothing//Script executing when tick done
	effect_tick_speed = 1//Speed of tick
	effect_multiple = EFFECT_NOT_MULTIPLE//Can buff multiplied with the same buffs?
	effect_hide_icon = false//Hide icon from buff bar?
	effect_draw_script = nothing//Effect drawing
	effect_destroy_script = nothing//Executing when effect duration = 0
	effect_priority = 0//Priority of effect drawing
	effect_nbt = {//Special struct for every effect
		duration : 1
	}
}

function regeneration_effect() : default_effect() constructor{
	effect_tick_script = function(){
		heal(0.01,obj_player_stats,false)
	}
	effect_nbt = {
		duration : 10
	}
}
