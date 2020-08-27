///@description event_fire
///@arg event
function scr_event_fire() {


		var ev = string(argument[0])
		if(ds_map_exists(global.eventMap,ev)){
			var listenerList = global.eventMap[? ev]
		
			var len = ds_list_size(listenerList)
		
			var listenerInfo, listener, script, args
		
			var i = 0; repeat(len){
				listenerInfo = listenerList[| i]
				listener = listenerInfo[0]
				script = listenerInfo[1]
			
				var lenArgs = array_length_1d(listenerInfo)-2
				var unregister = false
			
				if(lenArgs <= 0){
					if instance_exists(listener){
						with(listener) unregister = script_execute(script)
					} else unregister = true
				} else {
					if instance_exists(listener){
						args = array_create(lenArgs,0)
						array_copy(args,0,listenerInfo,2,lenArgs)
						with(listener) unregister = scr_script_execute_alt(script, args)
					} else unregister = true
				}
			
				if unregister{
					scr_event_unregister(ev,listener)
				
					i--
				}
			
				i++
			}
			show_debug_message("Event Fired: "+string(ev))
		}






}
