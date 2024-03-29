draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite(window_sprite,0,window_x,window_y)
#region Middle Panel
//Setup for hint about selected piece and cursor position
var selcur_str = ""
if !array_equals(selected_slot,[-1,-1]){
	selcur_str = selected_piece_word+string(selected_slot)
}
//Draw spell grid
for(var r=0;r<ds_grid_width(spell_data.spell_grid);r++)//Rows
{
	for(var c=0;c<ds_grid_height(spell_data.spell_grid);c++)//Columns
	{
		//Setup for drawing spell piece
		var xx = window_x+slots_x+((x_buffer+cell_size)*c)
		var yy = window_y+slots_y+((y_buffer+cell_size)*r)
		var spell_piece = spell_data.spell_grid[# r,c]
		//Execute render script from piece
		if spell_piece != -1
		{
			script_execute(spell_piece[@ 0][$ "piece_render_script"],xx,yy,spell_piece)
		}else{
			//If piece empty, then draw placeholder
			draw_sprite(slot_sprite,0,xx,yy)
		}
		
		//If mouse above piece
		if mouseover(xx,yy,xx+cell_size,yy+cell_size)
		{
			draw_sprite(spr_spell_creating_highlight_piece,1,xx,yy)
			selcur_str += " "+cursor_piece_word+string([r,c]) 
			
			if mouse_check_button_pressed(mb_left)
			{
				selected_slot = [r,c]
			}
		}
		//Draw highlight in selected piece position
		if array_equals(selected_slot,[r,c])
		{
			draw_sprite(spr_spell_creating_highlight_piece,0,xx,yy)
		}
	}
}
//Draw hint about selected piece and cursor position
draw_text_shadow(selcur_txt_x,selcur_txt_y,selcur_str,txt_fnt,1,txt_color_shadow,txt_color,1)
//Draw txt box with spell name
if mouse_check_button_pressed(mb_left){
	if mouseover(txt_box_x,txt_box_y,txt_box_x+txt_box_width,txt_box_y+txt_box_height){
		txt_box_selected = true
		keyboard_string = spell_data.spell_name
	}else{
		txt_box_selected = false	
	}
}
//Change txt_box color
var txt_c = txt_color
if !txt_box_selected{
	txt_c = txt_box_non_selected_col
}
//Draw name
draw_text_shadow(spell_name_txt_x,spell_name_txt_y,spell_name_word,txt_fnt,1,txt_color_shadow,txt_c,1)
//Draw txt box context
draw_text_shadow(txt_box_x,txt_box_y,spell_data.spell_name,txt_fnt,1,txt_color_shadow,txt_c,1)


//Import Spell Button
draw_sprite(import_spell_spr,0,import_spell_x,import_spell_y)
if mouseover(import_spell_x,import_spell_y,import_spell_x+import_spell_spr_width,import_spell_y+import_spell_spr_height){
	draw_overlay(import_spell_word,overlay_sprite)
	if mouse_check_button_pressed(mb_left){
		import_spell()
	}
}
//Export Spell Button
draw_sprite(export_spell_spr,0,export_spell_x,export_spell_y)
if mouseover(export_spell_x,export_spell_y,export_spell_x+export_spell_spr_width,export_spell_y+export_spell_spr_height){
	draw_overlay(export_spell_word,overlay_sprite)
	if mouse_check_button_pressed(mb_left){
		export_spell()
	}
}
#endregion

#region /////////////////////////////////////////Right Panel
//Draw group list
for(var i = 0; i < array_length(groups);i++){
	var xx = group_button_start_x+(i*(group_button_width+x_buffer))
	var yy = window_y
	draw_sprite(group_button_spr,0,xx,yy)
	draw_sprite(groups[i][$ "group_icon"],0,xx+group_icon_x,yy+group_icon_y)
	if mouseover(xx,yy,xx+group_button_width,yy+group_button_height){
		if mouse_check_button_pressed(mb_left){
			selected_group = groups[i][$ "group_id"]
		}
		draw_overlay(groups[i][$ "group_name"]+"\n"+groups[i][$ "group_description"],overlay_sprite)
	}
}

//Draw content of the group
var piece_i = ds_map_find_first(selected_group)

for(var i=0;i<ds_map_size(selected_group);i++){
	var xx = window_x+window_width+(i*(cell_size+x_buffer))
	var yy = window_y+50
		
	var piece_struct = selected_group[? piece_i]
	draw_sprite(piece_struct[$ "piece_sprite"],0,xx,yy)
		
	if mouseover(xx,yy,xx+cell_size,yy+cell_size){
		draw_overlay(piece_struct[$ "hint_txt"],overlay_sprite)
			
		if mouse_check_button_pressed(mb_left){
			if !array_equals(selected_slot,[-1,-1]){
				spell_data.spell_grid[# selected_slot[0],selected_slot[1]] = [selected_group[? piece_i],deep_copy(selected_group[? piece_i][$ "unique_data"])]
			}
		}
	}
	piece_i = ds_map_find_next(selected_group,piece_i)
}

#endregion

#region Left Panel
//Draw config word
draw_text_shadow(piece_configuration_txt_x,piece_configuration_txt_y,piece_configuration_word,txt_fnt,1,txt_color_shadow,txt_color,1)
//Draw config panel
draw_sprite(left_panel_sprite,0,left_panel_x,left_panel_y)

draw_sprite(hint_spr,0,hint_x,hint_y)
if mouseover(hint_x,hint_y,hint_x+hint_width,hint_y+hint_height){
	draw_overlay(hint_txt,overlay_sprite)
}
//Draw config sides
if selected_slot[0] != -1{
	var spell_piece = spell_data.spell_grid[# selected_slot[0],selected_slot[1]]
	if spell_piece = -1 exit
	var sides_array = spell_piece[@ 1][$ "input_sides"]
	var c_array = [spr_spell_creating_input_arrows_blue,spr_spell_creating_input_arrows_red,spr_spell_creating_input_arrows_green,spr_spell_creating_input_arrows_yellow]
	for(var i = 0; i<spell_piece[@ 0][$ "config_max_sides"];i++){
		var input_yy = select_input_start_y+((select_input_offset+select_input_height)*i)
		var input_xx = select_input_start_x
		draw_sprite(spr_spell_creating_select_input,0,input_xx,input_yy)
		draw_sprite(c_array[i],sides_array[i],input_xx,input_yy)
		draw_text_shadow(left_panel_x+10,input_yy,spell_piece[@ 0][$ "config_sides_names"][i],fnt_small,1,txt_color_shadow,txt_color,1)
		if mouse_check_button_pressed(mb_left){
			//Down arrow
			if mouseover(input_xx+10,input_yy+1,input_xx+21,input_yy+8){
				spell_piece[@ 1][$ "input_sides"][i] = spell_pieces_side.down
			}
			//Up arrow
			if mouseover(input_xx+10,input_yy+23,input_xx+21,input_yy+30){
				spell_piece[@ 1][$ "input_sides"][i] = spell_pieces_side.up
			}
			//Left arrow
			if mouseover(input_xx+1,input_yy+10,input_xx+8,input_yy+21){
				spell_piece[@ 1][$ "input_sides"][i] = spell_pieces_side.left
			}
			//Right arrow
			if mouseover(input_xx+23,input_yy+10,input_xx+30,input_yy+21){
				spell_piece[@ 1][$ "input_sides"][i] = spell_pieces_side.right
			}
		}
	}
}
	
#endregion