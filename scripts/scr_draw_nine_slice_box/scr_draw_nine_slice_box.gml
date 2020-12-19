 ///@description draw_nine_slice_box(sprite,x1,y1,x2,y2,sub_image)
///@param sprite
///@param x1
///@param y1
///@param x2
///@param y2
///@param sub_image
function draw_nine_slice_box(sprite, x1, y1, x2, y2, sub_image) {
	var slice_width = sprite_get_width(sprite)/3;
	var slice_height = sprite_get_height(sprite)/3;

	var width = abs(x2-x1);
	var height = abs(y2-y1);

	// Top
	draw_sprite_part_ext(sprite, sub_image, 0, 0, slice_width, slice_height, x1, y1, 1, 1, c_white, 1); // Left
	draw_sprite_part_ext(sprite, sub_image, slice_width, 0, slice_width, slice_height, x1+slice_width, y1, (width-slice_width*2)/slice_width, 1, c_white, 1); // Middle
	draw_sprite_part_ext(sprite, sub_image, slice_width*2, 0, slice_width, slice_height, x2-slice_width, y1, 1, 1, c_white, 1); // Right

	// Middle
	draw_sprite_part_ext(sprite, sub_image, 0, slice_height, slice_width, slice_height, x1, y1+slice_height, 1, (height-slice_height*2)/slice_height, c_white, 1); // Left
	draw_sprite_part_ext(sprite, sub_image, slice_width, slice_height, slice_width, slice_height, x1+slice_width, y1+slice_height, (width-slice_width*2)/slice_width, (height-slice_height*2)/slice_height, c_white, 1); // Middle
	draw_sprite_part_ext(sprite, sub_image, slice_width*2, slice_height, slice_width, slice_height, x2-slice_width, y1+slice_height, 1, (height-slice_height*2)/slice_height, c_white, 1); // Right

	// Bottom
	draw_sprite_part_ext(sprite, sub_image, 0, slice_height*2, slice_width, slice_height*2, x1, y2-slice_height, 1, 1, c_white, 1); // Left
	draw_sprite_part_ext(sprite, sub_image, slice_width, slice_height*2, slice_width, slice_height, x1+slice_width, y2-slice_height, (width-slice_width*2)/slice_width, 1, c_white, 1); // Middle
	draw_sprite_part_ext(sprite, sub_image, slice_width*2, slice_height*2, slice_width, slice_height, x2-slice_width, y2-slice_height, 1, 1, c_white, 1); // Right
}