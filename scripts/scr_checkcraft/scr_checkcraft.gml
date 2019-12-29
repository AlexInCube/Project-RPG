var xx=argument0
var yy=argument1


for(i = 0;  i < ds_grid_width(craft_map); i++)
	{
		if global.crafting_inventory[# 0,0] == craft_map[# i, 1] and global.crafting_inventory[# 1,0] == craft_map[# i, 3]
		{
			if global.crafting_inventory[# 0,1] == craft_map[# i, 2] and global.crafting_inventory[# 1,1] == craft_map[# i, 4]
			{
				if scr_mouseover(xx,yy,xx+32,yy+32) and mouse_check_button_pressed(mb_left)
				{
					global.crafting_inventory[# 0,1]-=craft_map[# i, 2]
					global.crafting_inventory[# 1,1]-=craft_map[# i, 4]
				
				
					if global.crafting_inventory[# 0,1]>=0
					{
						global.crafting_inventory[# 0,0]=item.none
					}
					if global.crafting_inventory[# 1,1]>=0
					{
						global.crafting_inventory[# 1,0]=item.none
					}
			
				global.mouse_slot[# 0,0]=craft_map[# i, 0]
				global.mouse_slot[# 0,1]+=craft_map[# i, 5]
			
				}
			
				if craft_map[# i, 0]!=item.none
				{
				draw_sprite(global.item_index[# craft_map[# i, 0],item_stat.sprite_index],0,xx+16,yy+16)
				}
			}
		}
	}
	