if story_tag_exist("bush_destroyer"){
	instance_destroy()
}
function destroy_after(){
	story_tag_status("bush_destroyer",true)
	instance_destroy(id)
}
event_register([event.trigger,id],id,destroy_after)
trigger_event = [event.trigger,id]