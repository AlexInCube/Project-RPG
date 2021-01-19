function add_story_tag(tag){
	with(obj_controller){
		ds_list_add(story_tags,tag)
	}
}

function remove_story_tag(tag){
	with(obj_controller){
		ds_list_delete(story_tags,ds_list_find_index(story_tags,tag))
	}
}

function exist_story_tag(tag){
	with(obj_controller){
		if ds_list_find_index(story_tags,tag) == -1{
			return false
		}
		return true
	}
}