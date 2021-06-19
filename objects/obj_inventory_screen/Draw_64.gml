draw_sprite(spr_inventory_screen,0,inventory_x,inventory_y)

for(var i=0;i<inventory_size;i++)
{
	slot(inventory,i,slotsxy[i,0],slotsxy[i,1],true)
}

