function shotgun_create() {
	//Setup scripts
	weapon_step_script=shotgun_step
	weapon_draw_script=shotgun_draw
	weapon_alarm_script=shotgun_alarm
	weapon_alarm_1_script=shotgun_load_ammo
	
	ammo_sprite = spr_shotgun_ammo//Sprite for projectile
	shotgun_shell = obj_shotgun_shell//Shell drop effect
	shellX = -4 //Offset for shells
	shellY = -2
	shoot_delay = room_speed//Shooting speed
	can_shoot = true//Allow shooting?
	ammo_max = 6//Ammo capacity
	ammo = ammo_max//Current ammo amount in weapon

	reloading = false //Reload mode
	reload_time = 15 //If reload mode, when load 1 ammo with delay, until we dont reached ammo_max
	
	shoot_sound = snd_shotgun_shot
	prepare_sound = snd_shotgun_prepare
	load_ammo_sound = snd_shotgun_load
	
	//Fireball
	sys_particle = part_system_create()
	part_system_layer(sys_particle, layer)
	part_particle = part_type_create()
	part_type_shape(part_particle, pt_shape_smoke)
	part_type_size(part_particle, 0, 0.25, 0, 0)
	part_type_scale(part_particle, 2,2)
	part_type_color3(part_particle, 41727, 0, 89)
	part_type_alpha3(part_particle, 0.19, 0, 0)
	part_type_speed(part_particle, 0, 0, 0, 0)
	part_type_direction(part_particle, 0, 360, 0, 0)
	part_type_gravity(part_particle, 0.05, 0)
	part_type_orientation(part_particle, 0, 360, 0, 0, 0)
	part_type_blend(part_particle, 1)
	part_type_life(part_particle, 30, 30)
	emit_particle = part_emitter_create(sys_particle)
}

function shotgun_step() {
	var mouse_dir = point_direction(x,y,mouse_x,mouse_y)
	if obj_player.state == move_state
	{
		if obj_controller.reloading_key and ammo_max > ammo{
			reloading = true
		}
		
		if reloading{
			if alarm[1] < 0{ 
				alarm[1] = reload_time
			}
			exit
		}
		
		
		if obj_controller.attack_key
		{
			if ammo > 0
			{
				if can_shoot == true
				{	
					for(var i=0;i<8;i++){
						var damage = instance_create_layer(x,y,"Instances",obj_damageprojectile)
						damage.sprite_index=ammo_sprite
						damage.creator = obj_player.id
						damage.knockback = 0
		
						var xforce = lengthdir_x(18,mouse_dir)
						var yforce = lengthdir_y(18,mouse_dir)
						with damage
						{
							physics_apply_local_impulse(x,y,xforce+(-4+i),yforce+(-4+i))
						}
						if obj_player_stats.phys_damage>0
						{
							damage.damage = obj_player_stats.phys_damage
							damage.damagetype = PHYSICALDAMAGETYPE
						}
					}
					
					instance_create_layer(x+shellX,y+shellY,"Instances",shotgun_shell)
					
					audio_play_sound(shoot_sound,1,0)
					screenshake(5)
					audio_play_sound(prepare_sound,1,0)
					
					//Knockback player (working if player not moving)
					var xforce = lengthdir_x(2,mouse_dir)
					var yforce = lengthdir_y(2,mouse_dir)
					with (obj_player){
						physics_apply_local_impulse(x,y,-xforce,-yforce)
					}

					//Emit fireball? particle
					part_type_direction(part_particle,mouse_dir-5, mouse_dir+5, 0, 0)
					part_emitter_region(sys_particle, emit_particle, x - 0, x + 0, y - 0, y + 0, ps_shape_line, ps_distr_linear)
					part_emitter_burst(sys_particle, emit_particle, part_particle, 15)

				
				
					alarm[0]=shoot_delay
					can_shoot=false
					ammo -= 1
				}
			}
		}
	}
}

/*
// Preventing Memory Leaks by deleting them once done:
part_type_destroy(part_particle)
part_emitter_destroy(sys_particle, emit_particle)
part_system_destroy(sys_particle)
*/
function shotgun_draw() {
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
	var mouse_dir = point_direction(x,y,mouse_x,mouse_y),y_s = 1//y_scale
	
	if mouse_dir>=90 and mouse_dir<=270{
		y_s = -1
	}
	
	
	//For reloading
	var i_i//image_index
	
	i_i = alarm[0] div sprite_get_number(spr_weapon_shotgun) 
	
	
	//Draw weapon
	draw_sprite_ext(spr_weapon_shotgun,i_i,obj_player.x,obj_player.y,1,y_s,mouse_dir,c_white,1)
	draw_text(obj_player.x,obj_player.y,string(ammo)+"/"+string(ammo_max))
	
}

function shotgun_alarm() {
	can_shoot=true
}

function shotgun_load_ammo() {
	ammo+=1
	audio_play_sound(load_ammo_sound,1,0)
	if 	audio_is_playing(load_ammo_sound){
	show_debug_message("LOAD GUN")
	}

	if ammo >= ammo_max{
		ammo = ammo_max
		audio_play_sound(prepare_sound,1,0)
		reloading = false
	}
}
