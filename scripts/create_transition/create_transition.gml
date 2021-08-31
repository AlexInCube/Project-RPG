function create_transition(tr_name){
	with instance_create_depth(0,0,-999,obj_transition){
		current_transition = tr_name
		switch(current_transition){
			case transition.fade_in: 
				fade = 0
			break
			case transition.fade_out: 
				fade = 1
			break
		}
	}
}