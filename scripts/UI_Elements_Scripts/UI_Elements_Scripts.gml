function create_ui_elements_list(){
	var ds_list_id = ds_list_create()
	var i=0;repeat(argument_count){
		ds_list_add(ds_list_id,argument[i])
		i++
	}
	return ds_list_id
}

function destroy_ui_element(ds_list_id,element){
	instance_destroy(ds_list_id[| element])
	ds_list_delete(ds_list_id,element)
}

function destroy_ui_elements_list(ds_list_id){
	var i=0;repeat(ds_list_size(ds_list_id)){
		instance_destroy(ds_list_id[| i])
		i++
	}
	ds_list_destroy(ds_list_id)
}

function ui_element_switch_lock(element_id,lock_state){
	element_id.mouse_lock = lock_state
}

function ui_element_switch_lock_all(ds_list_id,lock_state){
	var i=0;repeat(ds_list_size(ds_list_id)){
		ds_list_id[| i].mouse_lock = lock_state
		i++
	}
}

function create_button(xx,yy,_sprite,_depth,text,script){
	var _button = instance_create_depth(0,0,_depth,obj_ui_button)
	with (_button){
		button_x = xx
		button_y = yy
		button_txt = text
		button_sprite = _sprite
		button_script = script
		event_user(0)
	}
	return _button
}