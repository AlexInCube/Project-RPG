//@arg target_set_coord boolean 
function enemy_check_for_target(target_set_coord){
	if (instance_exists(target)){
		var dis = point_distance(x,y,target.x,target.y)
		if !is_undefined(target_set_coord){
			if target_set_coord{
				targetx = target.x
				targety = target.y
			}
		}
		return dis < sight
	}else{
		return false
	}
}