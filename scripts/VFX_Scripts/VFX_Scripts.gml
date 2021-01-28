function create_explosion(xx,yy,radius,damage,id_creator){
	with instance_create_layer(xx,yy,"Instances",obj_explosion){
		explosion_radius = radius
		self.damage = damage
		creator = object_get_name(id_creator.object_index)
		depth = -bbox_bottom
		image_xscale = explosion_radius/sprite_get_width(explosion_sprite)
		image_yscale = explosion_radius/sprite_get_height(explosion_sprite)
	}
}


///@description draw_light(light_radius)
///@function draw_light
///@param light_radius
function draw_light(size){
	if instance_exists(obj_light){
		if surface_exists(global.light){
			gpu_set_blendmode(bm_add)
			surface_set_target(global.light)
			var camera_x = camera_get_view_x(camera), camera_y = camera_get_view_y(camera)
			draw_ellipse_color(x - size - camera_x, y - size - camera_y, x + size - camera_x, y + size - camera_y,c_orange,c_black,false)
			surface_reset_target()
			gpu_set_blendmode(bm_normal)
		}
	}
}
