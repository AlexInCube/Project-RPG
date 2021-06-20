#region INVENTORY
draw_sprite(spr_inventory_screen,0,inventory_x,inventory_y)

for(var i=0;i<inventory_size;i++)
{
	slot(inventory,i,slotsxy[i,0],slotsxy[i,1],true)
}
#endregion

#region EQUIPMENT
draw_sprite(spr_equip_slots,0,equipment_x,equipment_y)

for(i=0;i<equipment_size;i++)
{
	slot(equipment,i,equipslotsxy[i,0],equipslotsxy[i,1],true,equipslotsxy[i,2])
}
#endregion

#region STATS
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_white)
draw_set_font(fnt_small)
draw_text(stats_x,stats_y,attribute_pointsword+string(obj_player_stats.attribute_points))
#endregion