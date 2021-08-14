#region Recipes List
//Draw recipes list background
draw_set_alpha(0.5)
draw_rectangle_color_fast(craft_start_x,craft_start_y,craft_list_zone_x2,craft_list_zone_y2,c_white,false)
draw_set_alpha(1)
//Set offsets for grid
var grid_x_offset = 0
var grid_y_offset = 0
//Draw recipes grid
var recipe_id = ds_map_find_first(global.craft_index.craft_recipes)
for(var i=0;i<ds_map_size(global.craft_index.craft_recipes);i++){
	var xx = ((craft_list_button_width+craft_list_button_offset_x)*grid_x_offset)
	var yy = (craft_list_button_height+craft_list_button_offset_y)*grid_y_offset
	
	var button_xx = craft_list_zone_x+xx
	var button_yy = craft_list_zone_y+yy

	var mo = mouseover(button_xx,button_yy,button_xx+craft_list_button_width,button_yy+craft_list_button_height)
	draw_sprite(spr_craft_list_background,mo,button_xx,button_yy)
	
	var craft_struct = global.craft_index.craft_recipes[? recipe_id]
	var item = return_struct_from_item_index_by_item_id(craft_struct[$ "item_crafted"])
	draw_sprite_stretched(item.item_sprite,0,button_xx,button_yy,craft_list_button_width,craft_list_button_height)
	
	if mo{
		draw_overlay(method_get_index(item_craft_overlay),[craft_struct])
	}

		
	if grid_x_offset == craft_list_grid_width{
		grid_x_offset = 0
		grid_y_offset++
	}else{
		grid_x_offset++
	}
	recipe_id = ds_map_find_next(global.craft_index.craft_recipes,recipe_id)
}
#endregion