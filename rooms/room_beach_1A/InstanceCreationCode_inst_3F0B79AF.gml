if exist_story_tag("bush_destroyer"){
	instance_destroy()
}
function destroy_after(){
	add_story_tag("bush_destroyer")
	instance_destroy(id)
}
event_register([event.trigger,id],id,destroy_after)
trigger_event = [event.trigger,id]