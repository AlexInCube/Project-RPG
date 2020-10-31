mob_count = 25
mob_obj = obj_enemy_slime

var _sprite = object_get_sprite(mob_obj)

for(var i=0;i<mob_count;i++){
	var xx = irandom_range(bbox_left,bbox_right)
	var yy = irandom_range(bbox_top,bbox_bottom)
	var _list = ds_list_create();
	
	var _num = collision_rectangle_list(xx,yy,xx + sprite_get_bbox_right(_sprite), yy + sprite_get_bbox_bottom(_sprite), all, false, true, _list, false);
	if _num > 0
	    {
			if ds_list_size(_list)>0{
				i--
				ds_list_destroy(_list);
				continue
			}
	    }
		
	instance_create_layer(xx,yy,"Instances",mob_obj)
}