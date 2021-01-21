function options_toggle(){
	button_var[0][# 3,button_var[1]] = !button_var[0][# 3,button_var[1]]
}

function options_slider(){
	slider_var[0][# 3,slider_var[1]][@ 0] = slider_var[3]*value
	slider_var[0][# 3,slider_var[1]][@ 0] = clamp(slider_var[0][# 3,slider_var[1]][@ 0],slider_var[2],slider_var[3])
}