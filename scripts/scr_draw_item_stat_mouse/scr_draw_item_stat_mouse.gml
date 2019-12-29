/// @description scr_draw_item_stat_mouse(inventory_id,slot_id);
/// @function scr_draw_item_stat_mouse
/// @param inventory_ID
/// @param slot_ID
var inventory = argument0
var slot_id = argument1
draw_set_alpha(1)
draw_set_color(c_white)

var statsamount = 0//Count item values
//Draw name
var name=global.item_index[# inventory[# slot_id, 0],item_stat.name]
draw_text(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0)-170+(20*statsamount),string(name))
statsamount+=1
/*
var itemtype=global.item_index[# inventory[# slot_id, 0],item_stat.type]
draw_text(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0)-170+(20*statsamount),string(itemtype))
statsamount+=1
*/
//Draw item description
var description=global.item_index[# inventory[# slot_id, 0],item_stat.description]
draw_text(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0)-170+(20*statsamount),string(description))
statsamount+=1
//Draw other item stats
/*
for (ii=6;ii<item_stat.total;ii++)
{
	
	if is_real(ii)
	{
		
		var string1 = scr_load_string_json("item_stat_"+string(ii))
		/*
		draw_sprite_part(spr_background,0,0,0,16,16,device_mouse_x_to_gui(0)-16,device_mouse_y_to_gui(0)-186)//Top Left Corner
		draw_sprite_part_ext(spr_background,0,17,0,1,16,device_mouse_x_to_gui(0),device_mouse_y_to_gui(0)-186,150,1,c_white,1)//Top Border
		draw_sprite_part(spr_background,0,32,0,16,16,device_mouse_x_to_gui(0)+(150),device_mouse_y_to_gui(0)-186)//Top Right Corner
		draw_sprite_part_ext(spr_background,0,0,16,16,1,device_mouse_x_to_gui(0)-16,device_mouse_y_to_gui(0)-170,1,20*statsamount,c_white,1)//Left Border
		draw_sprite_part(spr_background,0,0,32,16,16,device_mouse_x_to_gui(0)-16,device_mouse_y_to_gui(0)-186+16+(20*statsamount))//Bottom Left Corner
		draw_sprite_part_ext(spr_background,0,16,32,1,16,device_mouse_x_to_gui(0),device_mouse_y_to_gui(0)-186+16+(20*statsamount),150,1,c_white,1)//Bottom Border
		
		if global.item_index[# inventory[# slot_id, 0], ii]>=1
		{
			draw_text(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0)-170+(20*statsamount),string(global.item_index[# inventory[# slot_id, 0],ii])+" "+string1)
			statsamount+=1
		}
	}
}