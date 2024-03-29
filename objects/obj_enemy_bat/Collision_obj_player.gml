if state == bat_attack_state{
	var dir = point_direction(other.x,other.y,x,y)
	var xdir = lengthdir_x(1,dir)
	var ydir = lengthdir_y(1,dir)
	var damage = instance_create_layer(other.x+xdir,other.y+ydir,"Instances",obj_damage)
		damage.creator=id
		var dmg_multi = clamp(travelled_distance/max_travel,1,1)//0.5,2)
		damage.damage = stats.phys_damage.getValue()*dmg_multi
		damage.damagetype = DAMAGE_TYPE_PHYSICAL
		damage.image_xscale=0.5
		damage.image_yscale=0.5
		damage.knockback = self.knockback
	
	bat_set_aggresive_state()
	travelled_distance = 0
}