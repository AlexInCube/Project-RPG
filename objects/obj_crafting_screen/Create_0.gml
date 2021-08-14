craft_start_x = 0
craft_start_y = obj_gui_screen_controller.screen_start_y
#region Recipes List
craft_list_start_x = craft_start_x
craft_list_start_y = craft_start_y
//Buttons is a cells in grid
craft_list_button_sprite = spr_craft_list_background
craft_list_button_width = sprite_get_width(craft_list_button_sprite)
craft_list_button_height = sprite_get_height(craft_list_button_sprite)
craft_list_button_offset_x = 1
craft_list_button_offset_y = 1

craft_list_zone_x = craft_list_start_x + 4
craft_list_zone_y = craft_list_start_y + 4
craft_list_zone_x2 = craft_list_zone_x + GUIWIDTH
craft_list_zone_y2 = craft_list_zone_y + GUIHEIGHT - craft_list_start_y
craft_list_grid_width = (GUIWIDTH/2)/(craft_list_button_width+craft_list_button_offset_x)
#endregion

#region Crafting
craft_word_can_craft = string_replace(find_keyword("craft"),"interact_key",return_normal_control_word(global.settings.controls.interact_key))
craft_word_not_enough = find_keyword("craft_not_enough")
craft_button_spr = spr_craft_item_button
craft_button_x = 0
craft_button_y = 120


function item_craft_overlay(craft_struct){
	//Get result item
	var item_craft = return_struct_from_item_index_by_item_id(craft_struct[$ "item_crafted"][@ 0])
	//Setup item data
	var item_name = scribble(item_craft.item_locale_name)
	item_name.starting_format("fnt_small",c_black)
	item_name.align(fa_left,fa_top)
	item_name.wrap(300)
	//Setup background panel
	var items_arr_len = array_length(craft_struct.required_items)
	var over_hint_width = max(item_name.get_width()+50,string_width(craft_word_can_craft),items_arr_len*obj_crafting_screen.craft_list_button_width)
	var over_hint_height = 160
	var background = spr_craft_list_background
	var over_hint_x = 0, over_hint_y = 0
	over_hint_x = clamp(over_hint_x,device_mouse_x_to_gui(0)+20,GUIWIDTH-over_hint_width)
	over_hint_y = clamp(over_hint_y,device_mouse_y_to_gui(0),GUIHEIGHT-over_hint_height)
	draw_sprite_stretched(background,0,over_hint_x,over_hint_y,over_hint_width,over_hint_height)
	
	//Draw item icon
	draw_sprite_stretched(item_craft.item_sprite,0,over_hint_x+3,over_hint_y+3,obj_crafting_screen.craft_list_button_width,obj_crafting_screen.craft_list_button_height)
	item_name.draw(over_hint_x+42,over_hint_y)
	//Draw required components to craft
	var items_check = true//If player does not have at least one item in trade, items check was fail.
	for(var i=0;i<items_arr_len;i++){
		var component_arr = craft_struct.required_items[i]
		var component_item_id = component_arr[@ 0]
		var component_amount = component_arr[@ 1]
		
		var component_item_struct = return_struct_from_item_index_by_item_id(component_item_id)
		var component_draw_xx = over_hint_x+5+(obj_crafting_screen.craft_list_button_width*i)
		var component_draw_yy = over_hint_y+50
		
		
		
		if !check_requirement_item(global.inventory,component_item_id,component_amount){
			items_check = false
		}
		
		draw_sprite_stretched(component_item_struct.item_sprite,0,component_draw_xx,component_draw_yy,obj_crafting_screen.craft_list_button_width,obj_crafting_screen.craft_list_button_height)
		draw_text_shadow(component_draw_xx+obj_crafting_screen.craft_list_button_width/2,component_draw_yy+obj_crafting_screen.craft_list_button_height+20,component_amount,fnt_small,1,c_black,c_white,1)
	}
	
			
	if obj_controller.interact_key{
		if items_check{
			for(var i=0;i<items_arr_len;i++){
				var component_arr = craft_struct.required_items[i]
				var component_item_id = component_arr[@ 0]
				var component_amount = component_arr[@ 1]
				item_grab(component_item_id,component_amount,global.inventory)
			}
			item_gain(craft_struct.item_crafted[@ 0],craft_struct.item_crafted[@ 1],global.inventory)
		}
	}
	//Draw craft button
	var button_xx = over_hint_x+craft_button_x, button_yy = over_hint_y+craft_button_y
	draw_sprite_stretched(craft_button_spr,items_check,button_xx,button_yy,over_hint_width,40)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	var word_hint = craft_word_can_craft
	if items_check = false{
		word_hint = craft_word_not_enough
	}
	draw_text_shadow(button_xx+over_hint_width/2,button_yy+20,word_hint,fnt_small,1,c_gray,c_black,1)
}
	
#endregion