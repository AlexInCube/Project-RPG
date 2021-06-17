///@description event_register
///@arg event
///@arg id
///@arg script
///@arg arg1...*
function event_register() {
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
		show_debug_message(LOGGER_EVENT_MANAGER+"Event registered: "+ev)
}

///@description event_fire
///@arg event
function event_fire() {
		var ev = string(argument[0])
		if(ds_map_exists(global.eventMap,ev)){
			var listenerList = global.eventMap[? ev]
			var len = ds_list_size(listenerList)
		
			var listenerInfo, listener, script, args
		
			var i = 0; repeat(len){
				listenerInfo = listenerList[| i]
				listener = listenerInfo[0]
				script = listenerInfo[1]
			
				var lenArgs = array_length(listenerInfo)-2
				var unregister = false
			
				if(lenArgs <= 0){
					if instance_exists(listener){
						with(listener) unregister = script_execute(script)
					} else unregister = true
				} else {
					if instance_exists(listener){
						args = array_create(lenArgs,0)
						array_copy(args,0,listenerInfo,2,lenArgs)
						with(listener) unregister = script_execute_ext(script, args)
					} else unregister = true
				}
			
				if unregister{
					event_unregister(ev,listener)
				
					i--
				}
			
				i++
			}
			show_debug_message(LOGGER_EVENT_MANAGER+"Event Fired: "+string(ev))
		}
}

///@description event_unregister
///@arg event
///@arg id
function event_unregister() {
		var ev = string(argument[0])
		var objID = argument[1]
	
		if ds_map_exists(global.eventMap, ev){
			var listenerList = global.eventMap[? ev]
			var len = ds_list_size(listenerList)
		
			var i=0;repeat(len){
				var listenerInfo = listenerList[| i]
				if(listenerInfo[0] == objID){
					if(len == 1){
						ds_list_destroy(listenerList)
						ds_map_delete(global.eventMap,ev)
					}else ds_list_delete(listenerList,i)
					break
					show_debug_message(LOGGER_EVENT_MANAGER+"Event Unregisted: "+ev)
				}
				i++
			}
		}
}
