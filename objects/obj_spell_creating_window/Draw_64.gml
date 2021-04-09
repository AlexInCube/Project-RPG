draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite(window_sprite,0,window_x,window_y)
#region Middle Grid
draw_text_shadow(spell_name_txt_x - (string_width(spell_data.spell_name)/2),spell_name_txt_y,spell_name_word+spell_data.spell_name,txt_fnt,1,txt_color_shadow,txt_color,1)

for(var r=0;r<ds_grid_width(spell_data.spell_grid);r++)//Rows
{
	for(var c=0;c<ds_grid_height(spell_data.spell_grid);c++)//Columns
	{
		var xx = window_x+slots_x+((x_buffer+cell_size)*c)
		var yy = window_y+slots_y+((y_buffer+cell_size)*r)
		var spell_piece = spell_data.spell_grid[# r,c]

		if spell_piece != -1
		{
			script_execute(spell_piece[@ 0][$ "piece_render_script"],xx,yy,spell_piece)
		}else{
			draw_sprite(slot_sprite,0,xx,yy)
		}
		
		if mouseover(xx,yy,xx+cell_size,yy+cell_size)
		{
			draw_sprite(spr_spell_creating_highlight_piece,1,xx,yy)
			if mouse_check_button_pressed(mb_left)
			{
				selected_slot = [r,c]
			}
		}
				
		if array_equals(selected_slot,[r,c])
		{
			draw_sprite(spr_spell_creating_highlight_piece,0,xx,yy)
		}
	}
}
#endregion
#region Right Panel
//if selected_slot != -1{
var piece_i = ds_map_find_first(selected_group)

	for(var i=0;i<ds_map_size(selected_group);i++){
		var xx = window_x+window_width+(i*(cell_size+x_buffer))
		var yy = window_y
		
		draw_sprite(selected_group[? piece_i][$ "piece_sprite"],0,xx,yy)
		
		if mouseover(xx,yy,xx+cell_size,yy+cell_size){
			if mouse_check_button_pressed(mb_left){
				spell_data.spell_grid[# selected_slot[0],selected_slot[1]] = [selected_group[? piece_i],selected_group[? piece_i][$ "unique_data"]]
			}
		}
		piece_i = ds_map_find_next(selected_group,piece_i)
	}
//}
#endregion
#region Left Panel
draw_text_shadow(piece_configuration_txt_x,piece_configuration_txt_y,piece_configuration_word,txt_fnt,1,txt_color_shadow,txt_color,1)
draw_sprite(left_panel_sprite,0,left_panel_x,left_panel_y)
if selected_slot[0] != -1{
	var spell_piece = spell_data.spell_grid[# selected_slot[0],selected_slot[1]]
	if spell_piece = -1 exit
	var sides_array = spell_piece[@ 1][$ "input_sides"]
	var c_array = [spr_spell_creating_input_arrows_blue,spr_spell_creating_input_arrows_red,spr_spell_creating_input_arrows_green,spr_spell_creating_input_arrows_yellow]
	for(var i = 0; i<spell_piece[@ 0][$ "config_max_sides"];i++){
		var input_y = select_input_start_y+((select_input_offset+select_input_height)*i)
		var input_x = select_input_start_x
		draw_sprite(spr_spell_creating_select_input,0,input_x,input_y)
		draw_sprite(c_array[i],sides_array[i],input_x,input_y)

		if mouse_check_button_pressed(mb_left){
			//Down arrow
			if mouseover(input_x+10,input_y+1,input_x+21,input_y+8){
				spell_piece[@ 1][$ "input_sides"][i] = spell_pieces_side.down
			}
			//Up arrow
			if mouseover(input_x+10,input_y+23,input_x+21,input_y+30){
				spell_piece[@ 1][$ "input_sides"][i] = spell_pieces_side.up
			}
			//Left arrow
			if mouseover(input_x+1,input_y+10,input_x+8,input_y+21){
				spell_piece[@ 1][$ "input_sides"][i] = spell_pieces_side.left
			}
			//Right arrow
			if mouseover(input_x+23,input_y+10,input_x+30,input_y+21){
				spell_piece[@ 1][$ "input_sides"][i] = spell_pieces_side.right
			}
		}
	}
}
#endregion