/// @description Insert description here
// You can write your code in this editor
if guistate="isOpen"
{
	var guiwidth = display_get_gui_width()
	var guiheight = display_get_gui_height()
	var	yy=33
	var xx=33
	var pos=0

	scr_draw_black_screen()
	draw_sprite(spr_inventory_back,0,guiwidth/2,guiheight/2)//Draw Inventory Background
	for (i=0;i<ds_grid_width(global.chestinventory);i++)
	{
		
		if (i mod 10)==0{//If slot position equal 10, reset position and draw slot below
		pos=0
		yy+=33
		xx=33*pos
		}
		else
		{
		xx=33*pos
		}
		pos+=1
		//Draw Player Inventory Slots
		scr_draw_slot(global.chestinventory,i,(guiwidth/2-165)+xx,guiheight/2+yy-160)
	}
	
	var	yy=33
	var xx=33
	var pos=0
	
	for (i=0;i<ds_grid_width(global.inventory);i++)
	{
		
		if (i mod 10)==0{//If slot position equal 10, reset position and draw slot below
		pos=0
		yy+=33
		xx=33*pos
		}
		else
		{
		xx=33*pos
		}
		pos+=1
		//Draw Player Inventory Slots
		scr_draw_slot(global.inventory,i,(guiwidth/2-165)+xx,guiheight/2+yy)
	}
	scr_drawmousepickupeditem()
}