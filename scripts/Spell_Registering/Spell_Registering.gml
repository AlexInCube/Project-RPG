#macro PIECES_GROUP_GENERAL global.spell_pieces.general_pieces
#macro PIECES_GROUP_OPERATOR global.spell_pieces.operator_pieces

enum spell_pieces_side{
	right,
	down,
	left,
	up
}

function register_spell_pieces(){
	global.spell_pieces = {
		general_pieces : ds_map_create(),
		operator_pieces : ds_map_create()
	}
	
	add_spell_piece("spell_piece_nothing",default_spell_piece,PIECES_GROUP_GENERAL)
	add_spell_piece("spell_piece_unknown",spell_piece_unknown,PIECES_GROUP_GENERAL)
	add_spell_piece("spell_piece_play_sound",spell_piece_play_sound,PIECES_GROUP_GENERAL)
	add_spell_piece("spell_piece_get_player_pos",spell_piece_get_player_pos,PIECES_GROUP_GENERAL)
	

	show_debug_message(LOGGER_SPELL_MANAGER+"Registed "+string(
	ds_map_size(global.spell_pieces.general_pieces)
	+ds_map_size(global.spell_pieces.operator_pieces)
	))
}

function add_spell_piece(name,piece_struct,piece_group){
	piece_group[? name] = new piece_struct()
	with(piece_group[? name]){
		piece_unlocale_name = name
		piece_locale_name = find_keyword(piece_unlocale_name)
		piece_description = find_keyword(piece_unlocale_name)+"_description"
	}
}


function default_spell_piece() constructor{
	piece_unlocale_name = "no_name"
	piece_locale_name = find_keyword(piece_unlocale_name)
	piece_sprite = spr_spell_creating_empty_piece
	piece_description = find_keyword(piece_unlocale_name)+"_description"
	is_trick = false
	spell_power = 0
	spell_cost = 0
	piece_render_script = spell_piece_default_render
	config_max_sides = 3
	execute_script = function(){
		
	}
	unique_data = {
		input_sides: [spell_pieces_side.left,spell_pieces_side.right,spell_pieces_side.down,spell_pieces_side.up]
	}
}

function spell_piece_play_sound() : default_spell_piece() constructor{
	piece_sprite = spr_spell_creating_piece_play_sound
}

function spell_piece_get_player_pos() : default_spell_piece() constructor{
	piece_sprite = spr_spell_creating_piece_get_player_pos
}

function spell_piece_unknown() : default_spell_piece() constructor{
	piece_sprite = spr_spell_creating_piece_unknown
}