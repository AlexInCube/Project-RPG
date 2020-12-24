

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



function effect_script_execute(effect_id,effect_script){
	var _effect_struct = return_struct_from_effect_index_by_effect_id(effect_id)
	if _effect_struct != -1 and !is_undefined(_effect_struct)
	{
		if !is_undefined(_effect_struct[$ effect_script])
		{
			var _item_script = method_get_index(_effect_struct[$ effect_script])
			if _item_script != -1//If item have script
			{
				script_execute(_item_script)
			}
		}
	}
}


function effect_cycle_grid(buff_grid){
	if !ds_exists(buff_grid,ds_type_grid) exit
	for(var i=0;i<ds_grid_width(buff_grid);i++){
		var _effect = buff_grid[# i,0]
		//if _effect == undefined {continue}
		effect_script_execute(_effect,EFFECT_SCRIPT_TICK)
		if is_struct(buff_grid[# i,1]) buff_grid[# i,1][$ "duration"] -= 1/DELTATIME
		if buff_grid[# i,1][$ "duration"] <= 0{effect_remove(buff_grid,i)} 
	}
}

function effect_remove(buff_grid,effect_id){
	buff_grid[# effect_id,0] = 0
	buff_grid[# effect_id,1] = 0
}