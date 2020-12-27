

function register_effect(name,icon,effect_struct,arg_array){
	var ds_size = ds_list_size(global.effect_index)
	global.effect_index[| ds_size] = new effect_struct()
	with(global.effect_index[| ds_size]){
		effect_unlocale_name = name
		effect_locale_name = find_keyword(effect_unlocale_name)
		effect_description = find_keyword(effect_unlocale_name+"_description")
		effect_icon = icon
		self.arg_array = arg_array
	}
}

function effect_apply(effect_id,target){
	var _grid = target.buff_grid//Get buff grid from target
	var _grid_width = ds_grid_width(_grid)
	ds_grid_resize(_grid,_grid_width+1,ds_grid_height(_grid))//Resize grid because we add new effect
	_grid[# _grid_width,0] = effect_id//Apply effect to grid
	
	var _effect_struct = return_struct_from_effect_index_by_effect_id(effect_id)//Get effect struct from effect_index
	if _effect_struct != (-1 or undefined)
	{
		if !is_undefined(_effect_struct[$ "effect_nbt"])
		{
			_grid[# _grid_width,1] = deep_copy(_effect_struct[$ "effect_nbt"])
			_grid[# _grid_width,1][$ "tick"] = _effect_struct[$ EFFECT_TICKTIMER]
		}
		if !is_undefined(_effect_struct[$ EFFECT_SCRIPT_CREATE])
		{
			effect_script_execute(effect_id,EFFECT_SCRIPT_CREATE)
		}
	}
}

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
			var _effect_script = method_get_index(_effect_struct[$ effect_script])
			if !is_undefined(_effect_script) and  _effect_script != -1//If item have script
			{
				script_execute(_effect_script)
			}
		}
	}
}

function effect_cycle_grid(buff_grid){
	if !ds_exists(buff_grid,ds_type_grid) exit//Check buff grid
	var grid_width = ds_grid_width(buff_grid)
	if grid_width <= 0 exit
	var i=0; repeat(grid_width){//Loop grid
		var _effect = buff_grid[# i,0]//Get effect_id from grid
		if is_undefined(_effect){i++;continue}//If effect unknown, then dont execute code
		//if _effect == undefined {continue}
		buff_grid[# i,1][$ "tick"] -= 1*DELTATIME//Decrease tick every step
		if buff_grid[# i,1][$ "tick"] <= 0//If ticks = 0, then execute effect script
		{
			effect_script_execute(_effect,EFFECT_SCRIPT_TICK)
			var _effect_struct = return_struct_from_effect_index_by_effect_id(_effect)
			buff_grid[# i,1][$ "tick"] = _effect_struct[$ EFFECT_TICKTIMER]//Reset tick for effect
		}
		buff_grid[# i,1][$ "duration"] -= 1*DELTATIME
		//If buff coming to end, remove buff.
		if buff_grid[# i,1][$ "duration"] <= 0
		{
			effect_remove(buff_grid,i)
		}
		i++
	}
}

function effect_remove(buff_grid,effect){
	effect_script_execute(buff_grid[# effect,0],EFFECT_SCRIPT_DESTROY)
	buff_grid[# effect,0] = undefined
	buff_grid[# effect,1] = undefined
	for(var i=effect;i<=ds_grid_width(buff_grid)-1;i++){
		buff_grid[# i,0] = buff_grid[# i+1,0]
		buff_grid[# i,1] = buff_grid[# i+1,1]
	}
	ds_grid_resize(buff_grid,ds_grid_width(buff_grid)-1,2)
}