var _list = ds_list_create()
var target_list = collision_rectangle_list(bbox_left,bbox_top,bbox_right,bbox_bottom,obj_lifeform_parent,0,0,_list,false)
if target_list > 0{
	for(var i=0;i<ds_list_size(_list);i++){
		var target = _list[| i]
		var distance_to_target	  = point_distance(x,y,target.x,target.y)
		var distance_to_bound_box = point_distance(x,y,bbox_left,bbox_top)
	
		var relative = (distance_to_bound_box - distance_to_target) / distance_to_bound_box
	
		var dmg = relative*damage
	
		apply_damage(target,dmg,DAMAGE_TYPE_PHYSICAL)
		
		var dir = point_direction(x,y,target.x,target.y)
		var xforce = lengthdir_x(explosion_radius/2,dir)
		var yforce = lengthdir_y(explosion_radius/2,dir)
		with target
		{
			physics_apply_local_impulse(target.phy_position_x,target.phy_position_y,xforce,yforce)
		}
	}
}
ds_list_destroy(_list)