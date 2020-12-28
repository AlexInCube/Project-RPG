///@description draw_text_shadow(x, y, string, font, shadow_size, shadow_colour, text_colour, alpha);
///@arg x
///@arg y
///@arg string
///@arg font
///@arg shadow_size
///@arg shadow_color
///@arg text_color
///@arg alpha
function draw_text_shadow(_x, _y, _string, _font, _shadow_size, _shadow_colour, _text_colour, _alpha) {
	draw_set_font(_font);
	draw_set_alpha(_alpha)
	draw_set_color(_shadow_colour)
	draw_text((_x + _shadow_size), (_y + _shadow_size), string(_string));
	draw_set_color(_text_colour)
	draw_text(_x, _y, string(_string));
}
