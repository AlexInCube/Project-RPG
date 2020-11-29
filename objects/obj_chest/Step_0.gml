if instance_exists(guiid){
	if !collision_rectangle(x-interact_radius,y-interact_radius,x+interact_radius,y+interact_radius,obj_player,false,false)
	{
		//instance_destroy(guiid)
	}
}	

