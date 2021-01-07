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