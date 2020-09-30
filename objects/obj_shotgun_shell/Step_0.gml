switch(state){
	case "up": 
		depth=-y-10
		td += 1
		if td_max < td{
			state = "down"
		}
		image_angle += spin
	break
	case "down": 
		depth=-y-10
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