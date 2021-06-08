function create_buff_grid(){
	buff_grid = ds_grid_create(0,2)
	ds_grid_clear(buff_grid,undefined)
}

function register_effect(name,icon,effect_struct){
	var ds_size = ds_list_size(global.effect_index)
	global.effect_index[| ds_size] = new effect_struct()
	with(global.effect_index[| ds_size]){
		effect_unlocale_name = name
		effect_locale_name = find_keyword(effect_unlocale_name)
		effect_description = find_keyword(effect_unlocale_name+"_description")
		effect_icon = icon
	}
}

function effect_apply(target,effect_id,duration){
	var _grid = target.buff_grid//Get buff grid from target
	var _effect_struct = return_struct_from_effect_index_by_effect_id(effect_id)//Get effect struct from effect_index
	var _grid_width = ds_grid_width(_grid)
	
	if !is_undefined(_effect_struct) and _effect_struct != -1
	{
		if !_effect_struct[$ EFFECT_MULTIPLE]
		{
			var i=0; repeat(_grid_width)//Loop grid
			{
				if _grid[# i,0] == effect_id
				{
					_grid[# i,1] = deep_copy(_effect_struct[$ "effect_nbt"])
					_grid[# i,1][$ "tick"] = _effect_struct[$ EFFECT_TICKTIMER]
					if !is_undefined(duration)
					{
						_grid[# i,1][$ "duration"] = duration
					}
					exit
				}
				i++
			}
		}
	}

	//Apply effect to grid
	ds_grid_resize(_grid,_grid_width+1,ds_grid_height(_grid))//Resize grid because we add new effect
	_grid[# _grid_width,0] = effect_id
	//Copy effect data and execute create script
	if !is_undefined(_effect_struct) and _effect_struct != -1
	{
		if !is_undefined(_effect_struct[$ "effect_nbt"])
		{
			_grid[# _grid_width,1] = deep_copy(_effect_struct[$ "effect_nbt"])
			_grid[# _grid_width,1][$ "tick"] = _effect_struct[$ EFFECT_TICKTIMER]
			if !is_undefined(duration)
			{
				_grid[# _grid_width,1][$ "duration"] = duration
			}
		}
		if !is_undefined(_effect_struct[$ EFFECT_SCRIPT_CREATE])
		{
			effect_script_execute(effect_id,EFFECT_SCRIPT_CREATE,[target])
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



function effect_script_execute(effect_id,effect_script,arg_array){
	var _effect_struct = return_struct_from_effect_index_by_effect_id(effect_id)
	if _effect_struct != -1 and !is_undefined(_effect_struct)//Check effect struct
	{
		if !is_undefined(_effect_struct[$ effect_script])//Check if script exist
		{
			var _effect_script = method_get_index(_effect_struct[$ effect_script])
			if !is_undefined(_effect_script) and  _effect_script != -1//If item have script
			{
				if !is_undefined(arg_array){
					script_execute_ext(_effect_script,arg_array)
				}else{
					script_execute(_effect_script)
				}
			}
		}
	}
}

function effect_cycle_grid(target){
	var buff_grid = variable_instance_get(target,"buff_grid")
	if !ds_exists(buff_grid,ds_type_grid) exit//Check existing buff grid
	var grid_width = ds_grid_width(buff_grid)
	if grid_width <= 0 exit//If buff grid dont have buffs, stop cycle.
	var i=0; repeat(grid_width){//Loop grid
		var _effect = buff_grid[# i,0]//Get effect_id from grid
		if is_undefined(_effect) or _effect == UNKNOWN_EFFECT{i++;continue}//If effect unknown, then dont execute code
		//if _effect == undefined {continue}
		buff_grid[# i,1][$ "tick"] -= 1*DELTATIME//Decrease tick every step
		effect_script_execute(_effect,EFFECT_SCRIPT_DRAWING,[target])
		if buff_grid[# i,1][$ "tick"] <= 0//If ticks = 0, then execute effect script
		{
			effect_script_execute(_effect,EFFECT_SCRIPT_TICK,[target])
			var _effect_struct = return_struct_from_effect_index_by_effect_id(_effect)
			buff_grid[# i,1][$ "tick"] = _effect_struct[$ EFFECT_TICKTIMER]//Reset tick for effect
		}
		
		buff_grid[# i,1][$ "duration"] -= 1*DELTATIME
		//If buff coming to end, remove buff.
		if buff_grid[# i,1][$ "duration"] <= 0
		{
			effect_remove(target,buff_grid,i)
		}
		i++
	}
}

function effect_remove(target,buff_grid,effect){
	effect_script_execute(buff_grid[# effect,0],EFFECT_SCRIPT_DESTROY,[target])
	buff_grid[# effect,0] = UNKNOWN_EFFECT
	buff_grid[# effect,1] = UNKNOWN_EFFECT
	for(var i=effect;i<ds_grid_width(buff_grid)-1;i++){
		buff_grid[# i,0] = buff_grid[# i+1,0]
		buff_grid[# i,1] = buff_grid[# i+1,1]
	}
	if ds_grid_width(buff_grid)-1 <= 0 exit
	ds_grid_resize(buff_grid,ds_grid_width(buff_grid)-1,2)
}

function effect_exists(target,effect){
	var buff_grid = variable_instance_get(target,"buff_grid")
	for(var i=0;i<ds_grid_width(buff_grid)-1;i++){
		var buff_name = return_struct_from_effect_index_by_effect_id(BUFF_INVISIBLE)
		if buff_name[$ "effect_unlocale_name"] == effect{
			return true
		}
	}
	return false
}