///@description event_unregister
///@arg event
///@arg id
function scr_event_unregister() {


		var ev = argument[0]
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
				}
				i++
			}
		}



}
