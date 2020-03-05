

var guiwidth = display_get_gui_width()
var guiheight = display_get_gui_height()

draw_set_font(fnt_small)


	draw_sprite(spr_inventory_back,0,guiwidth/2,guiheight/2)//Draw Inventory Background
	draw_set_color(c_black)//Set color for player stats

	
	//Draw Craft
		scr_draw_slot(global.crafting_inventory,0,guiwidth/2-165,guiheight/2-148)//First Slot
		scr_draw_slot(global.crafting_inventory,1,guiwidth/2-125,guiheight/2-148)//Second Slot
		scr_draw_slot_output(global.crafting_inventory,2,guiwidth/2-30,guiheight/2-148)//Output slot
		scr_checkcraft(guiwidth/2-30,guiheight/2-148)//Draw output item

	//Draw player stats
	draw_set_halign(fa_left)
	draw_sprite(spr_staticonhp,0,guiwidth/2+20,guiheight/2-148)
	draw_text(guiwidth/2+35,guiheight/2-155,"Max Health:"+string(obj_player_stats.maxhp))
	draw_sprite(spr_staticonmana,0,guiwidth/2+20,guiheight/2-128)
	draw_text(guiwidth/2+35,guiheight/2-135,"Max Mana:"+string(obj_player_stats.maxmana))
	draw_sprite(spr_staticonphysarmor,0,guiwidth/2+20,guiheight/2-108)
	draw_text(guiwidth/2+35,guiheight/2-115,"Phys Armor:"+string(obj_player_stats.physarmor))
	draw_sprite(spr_staticonmagicarmor,0,guiwidth/2+20,guiheight/2-88)
	draw_text(guiwidth/2+35,guiheight/2-95,"Magic Armor:"+string(obj_player_stats.magicarmor))
	draw_sprite(spr_staticonstrength,0,guiwidth/2+20,guiheight/2-68)
	draw_text(guiwidth/2+35,guiheight/2-75,"Strength:"+string(obj_player_stats.strength))
	draw_sprite(spr_staticonintelligence,0,guiwidth/2+20,guiheight/2-48)
	draw_text(guiwidth/2+35,guiheight/2-55,"Intelligence:"+string(obj_player_stats.intelligence))
	draw_sprite(spr_staticonluck,0,guiwidth/2+20,guiheight/2-28)
	draw_text(guiwidth/2+35,guiheight/2-35,"Luck:"+string(obj_player_stats.luck))
	draw_sprite(spr_staticonattack,0,guiwidth/2+20,guiheight/2-8)
	draw_text(guiwidth/2+35,guiheight/2-15,"Phys Damage:"+string(obj_player_stats.attack))
	draw_sprite(spr_staticonmagicattack,0,guiwidth/2+20,guiheight/2+12)
	draw_text(guiwidth/2+35,guiheight/2+5,"Magic Damage:"+string(obj_player_stats.magicattack))
	
	//Draw Armor Slots
		scr_draw_slot(global.armor_equipped,0,guiwidth/2-165,guiheight/2-100,1,HELMET)
		scr_draw_slot(global.armor_equipped,1,guiwidth/2-165,guiheight/2-67,2,CHESTPLATE)
		scr_draw_slot(global.armor_equipped,2,guiwidth/2-165,guiheight/2-34,3,LEGGINGS)
		scr_draw_slot(global.armor_equipped,3,guiwidth/2-165,guiheight/2-1,4,BOOTS)
		scr_draw_slot(global.armor_equipped,4,guiwidth/2-132,guiheight/2-67,5,RING)
		scr_draw_slot(global.armor_equipped,5,guiwidth/2-132,guiheight/2-34,5,RING)
		scr_draw_slot(global.armor_equipped,6,guiwidth/2-132,guiheight/2-1,6,WEAPON)
		
	
		
	
		
		
		var	yy=33
	var xx=33
	var pos=0
	//Draw Slots With Item and Amount of them
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
		
	//Draw Item which mouse pickup
	scr_drawmousepickupeditem()
	
	var iid = global.mouse_slot[# 0, 0];
	var amount = global.mouse_slot[# 0, 1];

	
	
	
	//Close Inventory and get item back if mouse pickup them
		if obj_controller.inventory_key{
		guistate="isClosed"
			if iid != item.none
			{
				scr_gain_item(iid,amount)
				global.mouse_slot[# 0, 0]=item.none
				global.mouse_slot[# 0, 1]=0
			}
		}
		
		