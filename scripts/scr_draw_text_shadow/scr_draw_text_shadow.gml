///@description draw_text_shadow(x, y, string, font, shadow_size, shadow_colour, text_colour, alpha);
///@arg x
///@arg y
///@arg string
///@arg font
///@arg shadow_size
///@arg shadow_color
///@arg text_color
///@arg alpha
function draw_text_shadow(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) {
	var _x, _y, _string, _font, _shadow_size, _shadow_colour, _text_colour, _alpha;
	_x = argument0;
	_y = argument1;
	_string = argument2;
	_font = argument3;
	_shadow_size = argument4;
	_shadow_colour = argument5;
	_text_colour = argument6;
	_alpha = argument7
	draw_set_font(_font);
	draw_text_color((_x + _shadow_size), (_y + _shadow_size), string(_string),_shadow_colour,_shadow_colour,_shadow_colour,_shadow_colour,_alpha);
	draw_text_color(_x, _y, string(_string),_text_colour,_text_colour,_text_colour,_text_colour,_alpha);


}
