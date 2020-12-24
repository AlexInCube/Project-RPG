#macro EFFECT_TYPE_BUFF 1
#macro EFFECT_TYPE_DEBUFF 0
#macro EFFECT_NOT_MULTIPLE false
#macro EFFECT_MULTIPLE true

function register_effect(name,icon,type,effect_struct,arg_array){
	var ds_size = ds_list_size(global.effect_index)
	global.effect_index[| ds_size] = new effect_struct()
	with(global.effect_index[| ds_size]){
		effect_unlocale_name = name
		effect_locale_name = find_keyword(effect_unlocale_name)
		effect_description = find_keyword(effect_unlocale_name+"_description")
		effect_icon = icon
		effect_type = type
		self.arg_array = arg_array
	}
}

function effect_apply(effect_id,target){
	var _grid = target.buff_grid
	var _grid_width = ds_grid_width(_grid)-1
	ds_grid_resize(_grid,_grid_width+2,ds_grid_height(_grid))
	_grid[# _grid_width,0] = effect_id
	
	var _effect_struct = return_struct_from_effect_index_by_effect_id(effect_id)
	if _effect_struct != (-1 or undefined)
	{
		if _effect_struct[$ "effect_nbt"] != undefined
		{
			_grid[# _grid_width,1] = deep_copy(_effect_struct[$ "effect_nbt"])
		}
	}
}
/*
function effect_remove(effect_id,target){
	var _grid = target.buff_grid
	var _grid_width = ds_grid_width(_grid)-1
	ds_grid_delete_row(_grid,effect_id)
}
*/
function return_struct_from_effect_index_by_effect_id(effect_id){
	for (var i=0;i<ds_list_size(global.effect_index);i++){
		if global.effect_index[| i][$ "effect_unlocale_name"] = effect_id{
			return global.effect_index[| i]
		}
	}
	return undefined
}

#macro EFFECT_SCRIPT_CREATE "effect_create"
#macro EFFECT_SCRIPT_TICK "effect_tick_script"
#macro EFFECT_SCRIPT_DRAWING "effect_draw_script"
#macro EFFECT_SCRIPT_DESTROY "effect_destroy_script"

function effect_script_execute(effect_id,effect_script){
}

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
		heal(1,obj_player_stats,false)
	}
	effect_nbt = {
		duration : 10
	}
}