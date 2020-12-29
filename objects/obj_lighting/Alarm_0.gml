///@description Create new lighting
jump_count--
		var _list = ds_list_create()
		var _radius = 100
		var num = collision_rectangle_list(x-_radius,y-_radius,x+_radius,y+_radius,obj_lifeform_parent,false,true,_list,true)
		//ds_list_delete(_list,ds_list_find_index(_list,obj_player))
		if num > 0
		{
			if ds_list_size(_list) <= 1{instance_destroy(); exit} 
			
			var target = _list[| 0]
			for(var i = 0; i < ds_list_size(_list); i++){
				if _list[| i].object_index == obj_player{
					ds_list_delete(_list,_list[| i])
					continue
				}
				//show_debug_message(_list[| i])
				//show_debug_message(ds_list_find_index(target_list,_list[| i]))
				if _list[| i] == target_list[| ds_list_find_index(target_list,_list[| i])]{
					continue
				}else{
					target = _list[| i]
					break
				}
			}
			ds_list_add(target_list,target)
			
			if instance_exists(target)
			{
				var cur_light = instance_create_layer(target.x,target.y,"Instances",obj_lighting)
				cur_light.target_list = target_list
				cur_light.jump_count = jump_count
				cur_light.target = target
				self.target = target
				with create_damage(spr_damage,obj_player.id,0,0,false){
					damage = obj_player_stats.magic_damage
					damagetype = MAGICDAMAGETYPE
					visible = false
				}
				
			}else{
				ds_list_destroy(target_list)
				instance_destroy()
			}
		}
		ds_list_destroy(_list)

