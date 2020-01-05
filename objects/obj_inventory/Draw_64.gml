/// @description Insert description here
// You can write your code in this editor// comment here
var guiwidth = display_get_gui_width()
var guiheight = display_get_gui_height()


for(i=0;i<10;i++)
{
	//draw_sprite(spr_slot,0,(guiwidth/2-165)+(33*i),guiheight-32)
	
	scr_draw_slot(global.inventory,i+20,guiwidth/2-165+(33*i),guiheight-32)
	
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
