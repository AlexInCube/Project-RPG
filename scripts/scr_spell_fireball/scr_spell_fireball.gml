function scr_spell_fireball(argument0) {
	var manacost=argument0

	if obj_player_stats.mana>=manacost and obj_player.state!=scr_dash_state
	{
		var damage = instance_create_layer(obj_player.x,obj_player.y,"Instances",obj_damageprojectile)
		damage.sprite_index=spr_fireball
		damage.creator = id
		damage.knockback = 0
	
		var xforce = lengthdir_x(20,obj_player.face*90)
		var yforce = lengthdir_y(20,obj_player.face*90)
		with damage
		{
			physics_apply_local_impulse(obj_player.x,obj_player.y,xforce,yforce)
		}
		damage.damage = 5
		damage.damagetype = MAGICDAMAGETYPE
	
		obj_player_stats.mana -=manacost
	}




}
