draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite(window_sprite,0,window_x,window_y)

for(var r=0;r<ds_grid_width(spell_data);r++)//Rows
{
	for(var c=0;c<ds_grid_height(spell_data);c++)//Columns
	{
		var xx = window_x+slots_x+((x_buffer+cell_size)*c)
		var yy = window_y+slots_y+((y_buffer+cell_size)*r)
		draw_sprite(spell_data[# r,c][$ "piece_sprite"],0,xx,yy)
		
		if mouseover(xx,yy,xx+cell_size,yy+cell_size){
			if mouse_check_button_pressed(mb_left){
				selected_slot = [r,c]
			}
		}
		
		if array_equals(selected_slot,[r,c]){
			draw_sprite(spr_spell_creating_highlight_piece,0,xx,yy)
		}
	}
}

//if selected_slot != -1{
var piece_i = ds_map_find_first(selected_group)

	for(var i=0;i<ds_map_size(selected_group);i++){
		var xx = window_x+window_width+(i*(cell_size+x_buffer))
		var yy = window_y
		
		draw_sprite(selected_group[? piece_i][$ "piece_sprite"],0,xx,yy)
		
		if mouseover(xx,yy,xx+cell_size,yy+cell_size){
			if mouse_check_button_pressed(mb_left){
				spell_data[# selected_slot[0],selected_slot[1]] = selected_group[? piece_i]
			}
		}
		piece_i = ds_map_find_next(selected_group,piece_i)
	}
//}
