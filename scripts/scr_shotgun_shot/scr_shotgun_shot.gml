if obj_player.state == scr_move_state
{
	for(i=0;i<8;i++){
		var damage = instance_create_layer(obj_player.x,obj_player.y,"Instances",obj_damageprojectile)
		damage.sprite_index=spr_shotgun_shell
		damage.creator = id
		damage.knockback = 0
		
		var xforce = lengthdir_x(20,obj_player.face*90)+irandom_range(-4,4)
		var yforce = lengthdir_y(20,obj_player.face*90)+irandom_range(-4,4)
		with damage
		{
			physics_apply_local_impulse(obj_player.x,obj_player.y,xforce,yforce)
		}
		if obj_player_stats.phys_damage>0
		{
			damage.damage = obj_player_stats.phys_damage
			damage.damagetype = PHYSICALDAMAGETYPE
		}
	}
	audio_play_sound(snd_shotgun_shot,1,0)
}