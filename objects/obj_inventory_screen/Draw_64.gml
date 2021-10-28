#region INVENTORY
draw_sprite(spr_inventory_screen,0,inventory_x,inventory_y)
screen_draw_outline(inventory_x,inventory_y,180,140,inventory_backpack_word)
for(var i=0;i<inventory_size;i++)
{
	slot(inventory,i,slotsxy[i,0],slotsxy[i,1],true)
}
#endregion

#region EQUIPMENT
draw_sprite(spr_equip_slots,0,equipment_x,equipment_y)
screen_draw_outline(equipment_x,equipment_y,180,36,equipment_word)
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
draw_text(stats_block_x,stats_block_y,attribute_pointsword+string(obj_player_stats.attribute_points))
screen_draw_outline(stats_block_x,stats_block_y,200,216,stats_word)
for(var i = 0;i<array_length(stats_array);i++){
	var stat_struct = variable_struct_get(obj_player_stats.stats,stats_array[i])
	
	
	draw_text_shadow(stats_x,stats_y+(24*i),
					stat_struct.stat_name+": "+string(variable_struct_get(obj_player_stats.stats,stats_array[i]).getValue()),
					fnt_large,1,c_black,c_white,1)
					
	if obj_player_stats.attribute_points >= 1{
		assign_attribute_point_button(stats_block_x,stats_y+4+(25*i),stats_array[i])
	}
}
#endregion