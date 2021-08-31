function light_staff_create(_inv,slot) {
	//Setup scripts
	weapon_step_script=light_staff_step
	weapon_draw_script=light_staff_draw
	weapon_alarm_script=light_staff_alarm
	ammo_sprite = spr_light_staff_projectile//Sprite for projectile
	weapon_sprite = spr_MagicWeaponLightningStaff
	shoot_delay = 60//Shooting speed
	can_shoot = true//Allow shooting?
	inv = _inv
	_slot = slot
	mana_cost = read_item_struct(inv,_slot,"mana_cost")//Ammo capacity
	_light = read_item_struct(inv,_slot,"light_radius")
	jump_count = read_item_struct(inv,_slot,"jump_count")
}

function light_staff_step() {
	shoot_delay = 60/DELTATIME
	var mouse_dir = point_direction(x,y,mouse_x,mouse_y)
	if obj_player.state == move_state
	{
		if obj_controller.attack_key
		{
			if is_mana_enough(mana_cost)
			{
				if can_shoot == true
				{	
					var dmg = create_damage(ammo_sprite,obj_player.id,0,_light,true)
					var xforce = lengthdir_x(1,mouse_dir)
					var yforce = lengthdir_y(1,mouse_dir)
					with dmg
					{
						on_collision_script = light_staff_projectile
						alarm[0] = DELTATIME*convert_seconds_to_ticks(4)
						physics_apply_impulse(x,y,xforce,yforce)
						damage = obj_player_stats.magic_damage
						damagetype = DAMAGE_TYPE_MAGIC
						phy_speed_x = (phy_speed_x/8)*DELTATIME
						phy_speed_y = (phy_speed_y/8)*DELTATIME
					}
					variable_instance_set(dmg,"jump_count",jump_count)
					alarm[0]=shoot_delay
					can_shoot=false
					mana_consume(mana_cost)
				}
			}
		}
	}
}

function light_staff_draw() {
	//Weapon controller always where the player
	x = obj_player.x
	y = obj_player.y

	//Check mouse dir for adaptive depth
	if obj_player.mouse_dr >= 0 and obj_player.mouse_dr <= 3 {
		depth = -(obj_player.y-obj_player.spd)
	}else{
		depth = -(obj_player.y+obj_player.spd)
	}

	//For rotating
	var mouse_dir = point_direction(x,y,mouse_x,mouse_y)
	
	
	//Draw weapon
	draw_sprite_ext(weapon_sprite,0,obj_player.x,obj_player.y,1,1,mouse_dir-45,c_white,1)
	draw_set_valign(fa_bottom)
	draw_set_halign(fa_center)
	draw_set_font(fnt_large)
}

function light_staff_alarm() {
	can_shoot=true
}
	
function light_staff_projectile(){
	if jump_count > 0{
		var _lighting = instance_create_layer(x,y,"Instances",obj_lighting)
		variable_instance_set(_lighting,"jump_count",jump_count)
		with _lighting{
			target_list = ds_list_create()
			ds_list_add(target_list, obj_player.id)	
		}
	}
}