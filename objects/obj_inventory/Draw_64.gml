/// @description Insert description here
// You can write your code in this editor// comment here
if room=room_pause{exit}
var guiwidth = display_get_gui_width()
var guiheight = display_get_gui_height()
draw_set_font(fnt_small)

for(i=0;i<10;i++)
{
	draw_sprite(spr_slot,0,(guiwidth/2-165)+(33*i),guiheight-32)
	if global.inventory[# 20+i,0]>0
	{
	draw_sprite(global.item_index[# global.inventory[# 20+i,0], item_stat.sprite_index],0,guiwidth/2-149+(33*i),guiheight-16)
		if global.inventory[# 20+i,1]>0
		{
		draw_text(guiwidth/2-162+(33*i),guiheight-20,global.inventory[# 20+i,1])
		}
		if global.item_index[# global.inventory[# 20+i,0], item_stat.type]=item_type.spell
		{
			draw_text_colour(guiwidth/2-162+(33*i),guiheight-20,global.item_index[# global.inventory[# 20+i,0], item_stat.manacost],c_blue,c_blue,c_blue,c_blue,1)
		}
	}
	
}

if inventorylock=false{
	switch(guistate){
		case "isClosed":{
			if obj_controller.inventory_key{
			guistate="isInventory"
			}
			break
		}
		case "isInventory":{
		
	scr_draw_black_screen()//Draw black screen like minecraft gui
			scr_drawinventorytabs()
			scr_drawinventory()
		
		
			break
		}
	
		case "IsStats":{
		
		
	scr_draw_black_screen()//Draw black screen like minecraft gui
			scr_drawinventorytabs()
			scr_drawstatsmenu()
			break
		}
	}	
}
