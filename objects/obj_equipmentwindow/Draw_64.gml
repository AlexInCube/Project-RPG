draw_sprite(window_sprite,equipmode,window_x,window_y)
//Draw window name
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_white)
draw_set_font(fnt_small)
//draw_text(window_x+7,window_y,window_name+string(depth)+"  "+string(placefree)+"  "+string(mouseover))
if obj_player_stats.attribute_points == 0{
	draw_text(window_x+7,window_y,window_name)
}else{
	//Draw attribute points amount
	draw_text(window_x+7,window_y,attribute_pointsword+string(obj_player_stats.attribute_points))
}


switch(equipmode){
	case 0:
		//Draw attribute names
		draw_set_halign(fa_right)
		var an_x = window_x+142
		draw_text(an_x,window_y+65,strengthword)
		draw_text(an_x,window_y+85,energyword)
		draw_text(an_x,window_y+105,defenseword)
		draw_text(an_x,window_y+125,agilityword)
		//Draw button which go to advanced attributes
		draw_button_hud(window_x+122,window_y+27,window_x+233,window_y+49,spr_equip_buttons,equip_advanc_button_scr)
		draw_set_halign(fa_center)
		draw_text(window_x+177,window_y+27,advancedword)
		//Draw attribute value
		draw_set_halign(fa_left)
		var av_x = window_x+172
		draw_text(av_x,window_y+65,obj_player_stats.strength)
		draw_text(av_x,window_y+85,obj_player_stats.energy)
		draw_text(av_x,window_y+105,obj_player_stats.defense)
		draw_text(av_x,window_y+125,obj_player_stats.agility)
		//Draw attribute point buttons
		draw_set_valign(fa_top)
		if obj_player_stats.attribute_points > 0{
			var apb_x = window_x+210
			assign_attribute_point_button(apb_x,window_y+70,"strength")
			assign_attribute_point_button(apb_x,window_y+90,"energy")
			assign_attribute_point_button(apb_x,window_y+110,"defense")
			assign_attribute_point_button(apb_x,window_y+130,"agility")
		}
		//Draw armor and weapon slots
		for(i=0;i<inventory_size;i++)
		{
			//Draw sprite from item in slot
				if inventory[# i, 0]!=item.none
				{
					draw_sprite(global.item_index[# inventory[# i, 0], item_stat.sprite_index],1,slotsxy[i,0]+16,slotsxy[i,1]+16)
				}
				//Draw item amount if item amount in slots more than 1
				if inventory[# i, 1]>1
				{
					draw_text(slotsxy[i,0]+2,slotsxy[i,1]+12,inventory[# i, 1])
				}
	
			if placefree{
				slot(inventory,i,slotsxy[i,0],slotsxy[i,1])
			}
		}

		if placefree{
			for(i=0;i<inventory_size;i++)
			{
			if inventory[# i, 0]!=item.none
				{
					if mouseover(slotsxy[i,0],slotsxy[i,1],slotsxy[i,0]+32,slotsxy[i,1]+32)
					{
						draw_item_stat_mouse(inventory,i)
					}
				}
			}
		}
	break
	case 1:
		draw_button_hud(window_x+7,window_y+27,window_x+118,window_y+49,spr_equip_buttons,equip_basic_button_scr)
		draw_set_halign(fa_center)
		draw_text(window_x+63,window_y+27,basicword)
	break
}