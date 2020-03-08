if show_inventory{
for(i=0;i<inventory_size;i++)
{
	if global.inventory[# i, 0]!=item.none
	{
		if scr_mouseover(slotsxy[i,0],slotsxy[i,1],slotsxy[i,0]+32,slotsxy[i,1]+32)
		{
			scr_draw_item_stat_mouse(global.inventory,i)
		}
	}
	draw_set_font(fnt_small)
	draw_set_halign(fa_left)
	draw_text(window_x+5,window_y,inventoryname)
}
	
	
	
	
scr_drawmousepickupeditem()
}

