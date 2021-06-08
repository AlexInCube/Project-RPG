function instance_destroy_ext(object_id,flag){
	if !is_undefined(object_id){
		instance_destroy(object_id,flag)
	}else{
		instance_destroy()
	}
}