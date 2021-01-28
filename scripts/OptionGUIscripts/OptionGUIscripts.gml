function options_toggle(){
	button_var[0][# 3,button_var[1]] = !button_var[0][# 3,button_var[1]]
}

function options_slider(){
	//slider_var[0][# 3,slider_var[1]][@ 0] = max_value*value
	var normalized = clamp((device_mouse_x_to_gui(0)-slider_x) / slider_bar_width,0,1) 
	// realValue is the value in a continuous space - without the "grid" of steps
	var realValue = lerp(min_value,max_value,normalized)
	// count the number of steps in realValue and round it
	var numSteps = round(realValue/step_value)
	// get the actual value in terms of steps
	slider_var[0][# 3,slider_var[1]][@ 0]  = numSteps*step_value
	slider_var[0][# 3,slider_var[1]][@ 0] = clamp(slider_var[0][# 3,slider_var[1]][@ 0],min_value,max_value)
}