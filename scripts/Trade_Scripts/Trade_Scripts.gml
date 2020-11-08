///@decription create_trade_list
///@arg [[item_id,item_count]...,[item_id,item_count]]...,
///@arg [[item_id,item_count]...,[item_id,item_count]]...,
function create_trade_list(){
	var arg, i = 0
	repeat(argument_count){
		arg[i] = argument[i]
		i++
	}
	
	var _list = ds_list_create()
	
	i = 0; repeat(argument_count){
		var array = arg[i]
		_list[| i] = array
		
		i++
	}

	return _list
}