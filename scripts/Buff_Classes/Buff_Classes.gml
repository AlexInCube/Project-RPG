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

function invisible_player_effect() : default_effect() constructor{
	effect_tick_timer = 10
	effect_multiple = false
	effect_tick_script = function(){
		with(obj_player){
			switch (image_alpha){
				case 0.5 : image_alpha = 1 break 
				case 1 : image_alpha = 0.5 break
			}
			//show_debug_message("alpha switched"+string(image_alpha))
		}
	}
	effect_destroy_script = function(){
		with(obj_player){
			image_alpha = 1
		}
	}
	effect_nbt = {
		duration : convert_seconds_to_ticks(1)
	}
}

function regeneration_effect() : default_effect() constructor{
	effect_tick_timer = 59
	effect_multiple = true
	effect_tick_script = function(target){
		heal(1,target,false)
	}
	effect_nbt = {
		duration : convert_seconds_to_ticks(3)
	}
}

function attack_effect() : default_effect() constructor{
	effect_is_buff = true
	effect_create_script = function(target){
		target.phys_damage += 8
	}
	effect_destroy_script = function(target){
		target.phys_damage -= 8
	}
	effect_nbt = {
		duration : convert_seconds_to_ticks(5)
	}
}

function defense_effect() : default_effect() constructor{
	effect_is_buff = true
	effect_create_script = function(target){
		target.phys_armor += 8
	}
	effect_destroy_script = function(target){
		target.phys_armor -= 8
	}
	effect_nbt = {
		duration : convert_seconds_to_ticks(5)
	}
}


