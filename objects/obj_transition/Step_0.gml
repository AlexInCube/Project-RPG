switch(current_transition){
	case transition.fade_in: 
		fade += 0.01*DELTATIME
		if fade > 1 instance_destroy() 
	break
	case transition.fade_out: 
		fade -= 0.01*DELTATIME
		if fade <= 0 instance_destroy() 
	break
}