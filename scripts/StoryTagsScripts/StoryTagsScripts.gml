function register_story_tags(){
	global.story_tags = ds_map_create()
	
	add_story_tag("bush_destroyer")
	add_story_tag("ewgen_saved_from_slimes")
	
	show_debug_message("Registered "+string(ds_map_size(global.story_tags))+" story tags")
}

function save_story_tags(){
	ds_list_write(cur_story_tags)
}

function add_story_tag(tag){
	ds_map_add(global.story_tags,tag,false)
}

function update_tag_status(tag,status){
	global.story_tags[? tag] = status
	with(obj_controller){
		if status = true{
			ds_list_add(cur_story_tags,tag)
		}else{
			ds_list_delete(cur_story_tags,ds_list_find_index(cur_story_tags,tag))
		}
	}
}

function exist_story_tag(tag){
	return global.story_tags[? tag]
}