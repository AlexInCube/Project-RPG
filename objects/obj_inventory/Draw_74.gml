/// @description Insert description here
// You can write your code in this editor// comment here
if room=room_pause{exit}
if instance_exists(obj_textbox){exit}
draw_set_font(fnt_small)


if(!show_inventory){exit}

if show_inventory{
	draw_sprite(spr_inventorymenu,0,window_x,window_y)
	
	for(i=0;i<inventory_size;i++)
	{
		scr_slot(global.inventory,i,slotsxy[i,0],slotsxy[i,1])
		if global.inventory[# i, 0]!=item.none
		{
			draw_sprite(global.item_index[# global.inventory[# i, 0], item_stat.sprite_index],1,slotsxy[i,0]+16,slotsxy[i,1]+16)
		}
		if global.inventory[# i, 1]>1
		{
			draw_text(slotsxy[i,0]+2,slotsxy[i,1]+12,global.inventory[# i, 1])
		}
	}
	
}