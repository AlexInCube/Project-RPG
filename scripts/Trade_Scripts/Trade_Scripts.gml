///@decription create_trade_list
///@arg [ [item_id,item_count]...,[item_id,item_count] ]...,
function create_trade_list(){
	var arg, i = 0
	repeat(array_length(argument0)){
		arg[i] = argument0[i]
		i++
	}
	
	var _list = ds_list_create()
	
	i = 0; repeat(array_length(argument0)){
		var array = arg[i]
		_list[| i] = array
		
		i++
	}

	return _list
}

function open_trade_window(trade_arr,trader_name){
	if !instance_exists(obj_tradewindow){
		with create_window((GUIWIDTH/2)-150,(GUIHEIGHT/2)-124,obj_tradewindow){
			trade_array = trade_arr
			trade_creator = trader_name
			event_user(0)
		}
	}else{
		instance_destroy(obj_tradewindow)
	}
}
