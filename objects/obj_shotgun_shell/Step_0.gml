switch(state){
	case "up": 
		depth=-y
		td += 1
		image_angle += spin
		if td_max <= td{
			state = "down"
		}
	break
	case "down": 
		depth=-y
		td -= 1
		if td = 0{
			state = "rest"
		}
	break
	case "rest": 
		image_alpha -= fadeRate
		if image_alpha <= 0{
			instance_destroy()
		}
	break
}