///@description Inventory Window for Player/Chests inventories
event_inherited();
window_name=find_keyword("spell_creating_window")
window_sprite=spr_spell_creating_window
window_width=sprite_get_width(window_sprite)
window_height=sprite_get_height(window_sprite)
window_x = 450
window_y = 200

txt_color = c_white
txt_color_shadow = c_black
txt_fnt = fnt_small
/*						  OTHER 						*/
spell_data = {
	spell_grid : ds_grid_create(8,8),
	spell_name : "Spell Name",
	game_version : GM_version,
	debug : false,
	spell_cost : 0,
	spell_power : 0,
}
ds_grid_clear(spell_data.spell_grid,-1)

#region Left Panel
left_panel_sprite = spr_spell_creating_window_left_panel
left_panel_width = sprite_get_width(left_panel_sprite)
left_panel_height = sprite_get_height(left_panel_sprite)
left_panel_x = window_x - left_panel_width
left_panel_y = window_y + window_height - left_panel_height - 30

piece_configuration_word = find_keyword("piece_configuration")
piece_configuration_txt_x = left_panel_x + left_panel_width - string_width(piece_configuration_word) - 4
piece_configuration_txt_y = left_panel_y - string_height(piece_configuration_word)

select_input_sprite = spr_spell_creating_select_input
select_input_width = sprite_get_width(select_input_sprite)
select_input_height = sprite_get_height(select_input_sprite)
select_input_offset = 8
select_input_start_x = left_panel_x + left_panel_width - select_input_width - 3
select_input_start_y = left_panel_y + 8

hint_spr = spr_spell_creating_hint
hint_x = window_x - 30
hint_y = window_y
hint_width = sprite_get_width(hint_spr)
hint_height = sprite_get_height(hint_spr)
hint_txt = find_keyword("spell_creating_hint")
#endregion
#region Middle Panel
/*	SPELL NAME TEXTBOX	*/
txt_box_x = window_x + 94
txt_box_y = window_y + 301
txt_box_width = 204
txt_box_height = 23
txt_box_selected = false
txt_box_non_selected_col = c_dkgray 
keyboard_string = ""
char_limit = 23

spell_name_word = find_keyword("spell_name")
spell_name_txt_x = window_x + 10
spell_name_txt_y = window_y + window_height - string_height(spell_name_word) - 5
/*     TEXTBOX END      */
/*		SPELL GRID		*/
selected_slot = [-1,-1]//Rows/columns
slot_sprite = spr_spell_creating_empty_piece

selected_piece_word = find_keyword("selected_piece")
cursor_piece_word = find_keyword("cursor_piece")
selcur_txt_x = window_x
selcur_txt_y = window_y+window_height

cell_size=32//Slot size
//Starting XY
slots_x=14
slots_y=14
//Free space between slots
x_buffer=2
y_buffer=2
/*	SPELL GRID END	*/
import_spell_spr = spr_spell_creating_import_spell
import_spell_spr_width = sprite_get_width(import_spell_spr)
import_spell_spr_height = sprite_get_height(import_spell_spr)
import_spell_word = find_keyword("import_spell")
import_spell_x = window_x
import_spell_y = window_y-import_spell_spr_height
function import_spell(){
	if clipboard_has_text(){
		try{
			var save_data = json_parse(clipboard_get_text())
		} catch(e){
			show_debug_message("JSON STRING NOT SPELL")
			exit
		}
		var spell_grid_temp = spell_data.spell_grid
		ds_grid_read(spell_grid_temp,save_data.spell_grid)
		for(var w = 0;w<ds_grid_width(spell_grid_temp);w++){
			for(var h = 0;h<ds_grid_height(spell_grid_temp);h++){
				//spell_grid_temp[# w,h] = deep_copy(spell_grid_temp[# w,h])
				if is_string(spell_grid_temp[# w,h]){
					spell_grid_temp[# w,h] = json_parse(spell_grid_temp[# w,h])
				}
				if is_array(spell_grid_temp[# w,h]){
					spell_grid_temp[# w,h][@ 0] = PIECES_GROUP_ALL[? spell_grid_temp[# w,h][@ 0]]
					spell_grid_temp[# w,h][@ 1] = json_parse(spell_grid_temp[# w,h][@ 1])
				}
			}
		}
		spell_data.spell_name = save_data.spell_name
	}
	show_debug_message("Imported")
}
export_spell_spr = spr_spell_creating_export_spell
export_spell_spr_width = sprite_get_width(export_spell_spr)
export_spell_spr_height = sprite_get_height(export_spell_spr)
export_spell_word = find_keyword("export_spell")
export_spell_x = window_x+export_spell_spr_width+2
export_spell_y = window_y-export_spell_spr_height
function export_spell(){
	var spell_grid_temp = ds_grid_create(ds_grid_width(spell_data.spell_grid),ds_grid_height(spell_data.spell_grid))
	ds_grid_clear(spell_grid_temp,-1)
	for(var w = 0;w<ds_grid_width(spell_grid_temp);w++)
	{
		for(var h = 0;h<ds_grid_height(spell_grid_temp);h++)
		{
			if is_array(spell_data.spell_grid[# w,h]){
				spell_grid_temp[# w,h] = json_stringify([spell_data.spell_grid[# w,h][@ 0][$ "piece_unlocale_name"],json_stringify(spell_data.spell_grid[# w,h][@ 1])])
			}
		}
	}
	var save_data = deep_copy(spell_data)
	save_data.spell_grid = ds_grid_write(spell_grid_temp)
	ds_grid_destroy(spell_grid_temp)
	clipboard_set_text(json_stringify(save_data))
	show_debug_message("Exported")
}
#endregion
#region Right Panel
group_button_spr = spr_spell_creating_group_button
group_button_width = sprite_get_width(group_button_spr)
group_button_height = sprite_get_height(group_button_spr)
group_button_start_x = window_x+window_width
group_icon_x = group_button_width/2
group_icon_y = group_button_height/2
selected_group = PIECES_GROUP_GENERAL
groups = [{
	group_id : PIECES_GROUP_ALL,
	group_name : find_keyword("pieces_group_all"),
	group_description : find_keyword("pieces_group_all_description"),
	group_icon : spr_spell_creating_icon_group_all
},
{
	group_id : PIECES_GROUP_GENERAL,
	group_name : find_keyword("pieces_group_general"),
	group_description : find_keyword("pieces_group_general_description"),
	group_icon : spr_spell_creating_icon_group_general
},
{
	group_id : PIECES_GROUP_OPERATOR,
	group_name : find_keyword("pieces_group_operator"),
	group_description : find_keyword("pieces_group_operator_description"),
	group_icon : spr_spell_creating_icon_group_operators
},
]
/*
var names = variable_struct_get_names(global.spell_pieces)
for (var i = 0; i<variable_struct_names_count(global.spell_pieces); i++){
	array_push(groups,[names[i]])
}
*/
#endregion

function draw_overlay(txt){
	if surface_exists(global.overlay_surf){
		surface_set_target(global.overlay_surf)
		var element_txt = scribble(txt)
		element_txt.starting_format("fnt_small",txt_color)
		var over_hint_width = element_txt.get_width()+11
		var over_hint_height = element_txt.get_height()+12
		var over_hint_x = device_mouse_x_to_gui(0)+20
		var over_hint_y = device_mouse_y_to_gui(0)
		draw_sprite_stretched(spr_spell_creating_nine_slice,0,over_hint_x,over_hint_y,over_hint_width,over_hint_height)
		element_txt.draw(over_hint_x+6,over_hint_y)
		surface_reset_target()
	}
}