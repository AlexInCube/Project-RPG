function register_story_tags(){
	global.story_tags = ds_map_create()
	
	story_tag_add("bush_destroyer")
	story_tag_add("ewgen_saved_from_slimes")
	story_tag_add("help_ewgen_with_water")
	
	console_log("Registered "+string(ds_map_size(global.story_tags))+" story tags")
}

function story_tags_save(){
	ds_list_write(cur_story_tags)
}

function story_tag_add(tag){
	ds_map_add(global.story_tags,tag,false)
}

function story_tag_status(tag,status){
	global.story_tags[? tag] = status
	with(obj_controller){
		if status = true{
			ds_list_add(cur_story_tags,tag)
		}else{
			ds_list_delete(cur_story_tags,ds_list_find_index(cur_story_tags,tag))
		}
	}
}

function story_tag_exist(tag){
	return global.story_tags[? tag]
}