event_inherited()

draw_set_halign(fa_left)
draw_set_valign(fa_top)
for(i=0;i<inventory_size;i++)
{
	slot(inventory,i,slotsxy[i,0],slotsxy[i,1],placefree)
}

