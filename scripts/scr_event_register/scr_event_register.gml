///@description scr_event_register
///@arg event
///@arg id
///@arg script
///@arg arg1...*
function scr_event_register() {

		var	ev = string(argument[0])
		var objID = argument[1]
	
		if !ds_map_exists(global.eventMap,ev){
			var listenerList = ds_list_create()
		
			ds_map_add_list(global.eventMap,ev,listenerList)
		
		}else{
			var listenerList = global.eventMap[? ev]
		}
	
		var listenerInfo
	
		listenerInfo[0] = objID
	
		var len = argument_count-2
		var i=0; repeat(len){
			listenerInfo[i+1]=argument[i+2]
			i++	
		}
	
		ds_list_add(listenerList,listenerInfo)
	



}
