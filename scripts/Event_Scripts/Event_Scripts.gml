function event_register(objID,ev,scr,scr_args = []) {
	if !ds_map_exists(global.eventMap,ev){
		var listenerList = ds_list_create()
		
		ds_map_add_list(global.eventMap,ev,listenerList)
	}else{
		var listenerList = global.eventMap[? ev]
	}
	
	var listenerInfo = []
		
	array_push(listenerInfo,objID,scr,scr_args)
	
	ds_list_add(listenerList,listenerInfo)
	console_log(LOGGER_EVENT_HANDLER+"Event registered: "+ev+" by: "+string(object_get_name(objID.object_index)))
}

function event_fire(ev,ev_data) {
		if(ds_map_exists(global.eventMap,ev)){
			var listenerList = global.eventMap[? ev]
			var len = ds_list_size(listenerList)
		
			var listenerInfo, listener, args
		
			var i = 0; repeat(len){
				//ListenerInfo: 0 - object_id (who registered event), 1 - script_id, 2 - scr_args
				listenerInfo = listenerList[| i]
				listener = listenerInfo[0]
				args = []
				
				if !array_equals(listenerInfo[2],[]){
					array_copy(args,0,listenerInfo[2],0,array_length(listenerInfo[2]))
				}
				if !is_undefined(ev_data){
					array_push(args,ev_data)
				}
			
				var unregister = false
			
				if instance_exists(listener){
					with(listener) unregister = script_execute_ext(listenerInfo[1], args)
				} else unregister = true
			
				if unregister{
					event_unregister(ev,listener)
					i--
				}
			
				i++
			}
			console_log(LOGGER_EVENT_HANDLER+"Event Fired: "+string(ev)+" EvData: "+string(ev_data))
		}
}

///@description event_unregister
///@arg event
///@arg id
function event_unregister(ev,objID) {
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
					console_log(LOGGER_EVENT_HANDLER+"Event Unregisted: "+string(ev))
				}
				i++
			}
		}
}
