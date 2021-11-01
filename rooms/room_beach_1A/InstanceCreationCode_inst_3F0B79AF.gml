if story_tag_exist("bush_destroyer"){
	instance_destroy()
}
function destroy_after(ev){
	if ev.trigger_id != 0 exit
	story_tag_status("bush_destroyer",true)
	instance_destroy(id)
}
event_register(id,EVENT_TRIGGER,destroy_after)