function spell_in_debug(){
	return true
}

function spell_throw_exception(){
	console_log("spell error")
}


function spell_piece_default_render(xx,yy,spell_piece){
	draw_sprite(spell_piece[@ 0][$ "piece_sprite"],0,xx,yy)
	var input_sides = spell_piece[@ 1][$ "input_sides"]
	var c_array = [spr_spell_creating_input_arrows_blue,spr_spell_creating_input_arrows_red,spr_spell_creating_input_arrows_green,spr_spell_creating_input_arrows_yellow]
	if input_sides != -1{
		for(var i = 0; i<spell_piece[@ 0][$ "config_max_sides"]; i++){
			draw_sprite(c_array[i],input_sides[i],xx,yy)
		}
	}
}