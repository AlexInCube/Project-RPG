/// @description scr_draw_item_stat_mouse(inventory_id,slot_id);
/// @function scr_draw_item_stat_mouse
/// @param inventory_ID
/// @param slot_ID

var inventory = argument0
var slot_id = argument1


draw_set_alpha(1)
draw_set_color(c_white)
var maxtextwidth = 200
var textheight = 20
var yy = 20

for (ii=6;ii<item_stat.total;ii++)
{
	
	if is_real(ii)
	{
		
		var string1 = scr_find_keyword("item_stat_"+string(ii))
		
		
		
		if global.item_index[# inventory[# slot_id, 0], ii]>=1
		{
			yy+=20
			draw_text(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0)-yy,string(global.item_index[# inventory[# slot_id, 0],ii])+" "+string1)
			
		}
	}
}


//Draw item description

var description=scr_find_keyword(global.item_index[# inventory[# slot_id, 0],item_stat.description])
yy+=string_height_ext(description,textheight,maxtextwidth)
draw_text_ext(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0)-yy,description,textheight,maxtextwidth)


//Draw itemtype
yy+=20
var itemtype=global.item_index[# inventory[# slot_id, 0],item_stat.type]
draw_text(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0)-yy,scr_find_keyword("item_type_"+string(itemtype)))

//Draw name
yy+=20
var name=global.item_index[# inventory[# slot_id, 0],item_stat.name]
draw_text(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0)-yy,name)



