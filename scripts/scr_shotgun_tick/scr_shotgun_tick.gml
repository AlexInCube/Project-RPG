function scr_shotgun_tick() {

	var mouse_dir = point_direction(x,y,mouse_x,mouse_y)
	if obj_player.state == scr_move_state
	{
		if obj_controller.attack_key
		{
			if can_shoot == true
			{
				for(i=0;i<8;i++){
					var damage = instance_create_layer(obj_player.x,obj_player.y,"Instances",obj_damageprojectile)
					damage.sprite_index=spr_shotgun_shell
					damage.creator = obj_player.id
					damage.knockback = 0
		
					var xforce = lengthdir_x(16,mouse_dir)
					var yforce = lengthdir_y(16,mouse_dir)
					with damage
					{
						physics_apply_local_impulse(obj_player.x,obj_player.y,xforce+irandom_range(-4,4),yforce+irandom_range(-4,4))
					}
					if obj_player_stats.phys_damage>0
					{
						damage.damage = obj_player_stats.phys_damage
						damage.damagetype = PHYSICALDAMAGETYPE
					}
				}
				audio_play_sound(snd_shotgun_shot,1,0)
			
				audio_play_sound(snd_shotgun_prepare,1,0)
				alarm[0]=shoot_delay
				can_shoot=false
			}
		}
	}


}
