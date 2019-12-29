var guiwidth = display_get_gui_width()
var guiheight = display_get_gui_height()

		
		
		draw_sprite(spr_inventorytabs,1,guiwidth/2-168,guiheight/2-224)
		if scr_mouseover(guiwidth/2-136,guiheight/2-248,guiwidth/2-72,guiheight/2-200)
		{
			if mouse_check_button_pressed(mb_left)
			{
			guistate="IsStats"
			}
		}
		draw_sprite(spr_inventorytabs,2,guiwidth/2-104,guiheight/2-224)
		
		if scr_mouseover(guiwidth/2-200,guiheight/2-248,guiwidth/2-136,guiheight/2-200)
		{
			if mouse_check_button_pressed(mb_left)
			{
			guistate="isInventory"
			}
		}