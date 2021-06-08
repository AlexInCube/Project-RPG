enum spell_pieces_side{
	right,
	down,
	left,
	up
}

#macro SPELL_DATA_NONE "spell_data_none"
#macro SPELL_DATA_ANY "spell_data_any"
#macro SPELL_DATA_NUMBER "spell_data_number"
#macro SPELL_DATA_COORD "spell_data_coord"
#macro SPELL_DATA_ENTITY "spell_data_entity"


#macro SPELL_WORD_INPUT find_keyword("spell_piece_input")
#macro SPELL_WORD_OUTPUT find_keyword("spell_piece_output")

#macro SPELL_WORD_NOTHING find_keyword("spell_word_nothing")
#macro SPELL_WORD_COORD find_keyword("spell_word_coord")

#macro PIECES_GROUP_ALL global.spell_pieces.all_pieces
#macro PIECES_GROUP_GENERAL global.spell_pieces.general_pieces
#macro PIECES_GROUP_OPERATOR global.spell_pieces.operator_pieces


function register_spell_pieces(){
	global.spell_pieces = {
	}
	
	add_spell_group("all_pieces")
	add_spell_group("general_pieces")
	add_spell_group("operator_pieces")
	//add_spell_piece("spell_piece_nothing",default_spell_piece,PIECES_GROUP_GENERAL)
	add_spell_piece("spell_piece_unknown",spell_piece_unknown,PIECES_GROUP_OPERATOR)
	add_spell_piece("spell_piece_play_sound",spell_piece_play_sound,PIECES_GROUP_GENERAL)
	add_spell_piece("spell_piece_get_player_pos",spell_piece_get_player_pos,PIECES_GROUP_GENERAL)
	

	show_debug_message(LOGGER_SPELL_MANAGER+"Registed "+string(
	ds_map_size(global.spell_pieces.general_pieces)
	+ds_map_size(global.spell_pieces.operator_pieces)
	)+" spells")
}

function add_spell_group(name){
	variable_struct_set(global.spell_pieces,name,ds_map_create())
}

function add_spell_piece(name,piece_struct,piece_group){
	var point_struct = new piece_struct()
	piece_group[? name] = point_struct
	PIECES_GROUP_ALL[? name] = point_struct
	with(piece_group[? name]){
		piece_unlocale_name = name
		piece_locale_name = find_keyword(piece_unlocale_name)
		piece_description = find_keyword(piece_unlocale_name+"_description")
		
		if is_array(config_sides_names){config_max_sides = array_length(config_sides_names)}

		/* SETUP FOR UI */
		hint_txt = piece_locale_name+"\n"+"[c_ltgray]"+piece_description+"[/]"
		hint_txt += "\n"+SPELL_WORD_OUTPUT+" "+"[c_yellow]"+output_txt_help+" "+"[["+find_keyword(output)+"]"+"[/]"
		for(var i = 0; i<array_length(input); i++){
			hint_txt += "\n"+SPELL_WORD_INPUT+" "+"[c_yellow]"+config_sides_names[i]+" "+"[["+find_keyword(input[i])+"]"+"[/]"
		}
		
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
	input = [SPELL_DATA_ANY]
	config_sides_names = [find_keyword("Test"),find_keyword("Test"),find_keyword("Test"),find_keyword("Test")]
	output = SPELL_DATA_NONE
	output_txt_help = SPELL_WORD_NOTHING
	execute_script = function(){
		
	}
	unique_data = {
		input_sides: [spell_pieces_side.left,spell_pieces_side.right,spell_pieces_side.down,spell_pieces_side.up]
	}
}

function spell_piece_play_sound() : default_spell_piece() constructor{
	piece_sprite = spr_spell_creating_piece_play_sound
	input = [SPELL_DATA_NUMBER,SPELL_DATA_COORD]
	output = SPELL_DATA_NONE
	output_txt_help = SPELL_WORD_NOTHING
}

function spell_piece_get_player_pos() : default_spell_piece() constructor{
	piece_sprite = spr_spell_creating_piece_get_player_pos
	input = -1
	output = SPELL_DATA_COORD
	output_txt_help = SPELL_WORD_COORD
}

function spell_piece_unknown() : default_spell_piece() constructor{
	piece_sprite = spr_spell_creating_piece_unknown
	input = -1
}