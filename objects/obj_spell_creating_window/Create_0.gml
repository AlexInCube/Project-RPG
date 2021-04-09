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
/*						LEFT PANEL						*/
left_panel_sprite = spr_spell_creating_window_left_panel
left_panel_width = sprite_get_width(left_panel_sprite)
left_panel_height = sprite_get_height(left_panel_sprite)
left_panel_x = window_x - left_panel_width
left_panel_y = window_y + window_height - left_panel_height

piece_configuration_word = find_keyword("piece_configuration")
piece_configuration_txt_x = left_panel_x + left_panel_width - string_width(piece_configuration_word) - 4
piece_configuration_txt_y = left_panel_y - string_height(piece_configuration_word)

select_input_sprite = spr_spell_creating_select_input
select_input_width = sprite_get_width(select_input_sprite)
select_input_height = sprite_get_height(select_input_sprite)
select_input_offset = 8
select_input_start_x = left_panel_x + left_panel_width - select_input_width - 3
select_input_start_y = left_panel_y + 8
/*						  OTHER 						*/
spell_data = {
	spell_grid : ds_grid_create(8,8),
	spell_name : "Spell Name",
	debug : false,
	spell_cost : 0,
	spell_power : 0,
}
ds_grid_clear(spell_data.spell_grid,-1)
/*[
Spell Piece Id
Spell Piece Data
]
*/
/*					MIDDLE PANEL						*/
spell_name_word = find_keyword("spell_name")
spell_name_txt_x = window_x + window_width/2 - string_width(spell_name_word)/2
spell_name_txt_y = window_y - string_height(spell_name_word)
selected_slot = [-1,-1]//Rows/columns
selected_group = PIECES_GROUP_GENERAL
slot_sprite = spr_spell_creating_empty_piece
cell_size=32//Slot size
//Starting XY
slots_x=14
slots_y=14
//Free space between slots
x_buffer=2
y_buffer=2
/*					RIGHT PANEL							*/