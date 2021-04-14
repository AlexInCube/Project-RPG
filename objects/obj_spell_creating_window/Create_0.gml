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
	debug : false,
	spell_cost : 0,
	spell_power : 0,
}
ds_grid_clear(spell_data.spell_grid,-1)
/*[
Spell Piece Id
Spell Piece Data
]
/*						LEFT PANEL						*/
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
/*					MIDDLE PANEL						*/
/*	SPELL NAME TEXTBOX	*/
txt_box_x = window_x + 94
txt_box_y = window_y + 301
txt_box_width = 204
txt_box_height = 23
txt_box_selected = false
txt_box_non_selected_col = c_dkgray 
keyboard_string = ""
char_limit = 23
/*     TEXTBOX END      */
spell_name_word = find_keyword("spell_name")
spell_name_txt_x = window_x + 10
spell_name_txt_y = window_y + window_height - string_height(spell_name_word) - 5

selected_slot = [-1,-1]//Rows/columns
selected_group = PIECES_GROUP_GENERAL
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
/*					RIGHT PANEL							*/

/* OTHER */
function draw_overlay(txt){
	surface_set_target(global.overlay_surf)
	var element_txt = scribble(txt)
	element_txt.starting_format("fnt_small",txt_color)
	var over_hint_width = element_txt.get_width()+11
	var over_hint_height = element_txt.get_height()
	var over_hint_x = device_mouse_x_to_gui(0)+20
	var over_hint_y = device_mouse_y_to_gui(0)
	draw_sprite_stretched(spr_spell_creating_nine_slice,0,over_hint_x,over_hint_y,over_hint_width,over_hint_height)
	element_txt.draw(over_hint_x+6,over_hint_y)
	surface_reset_target()
}