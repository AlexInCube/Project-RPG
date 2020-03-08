
draw_sprite(spr_inventory_back,0,global.guiwidth/2,global.guiheight/2)//Draw Inventory Background

for (i=0;i<5;i++)
		{
			draw_sprite(spr_skills,i,global.guiwidth/2-175,global.guiheight/2-175+(i*50))//Stat Icons
			if obj_player_stats.skillpoints>0
			{
				draw_sprite(spr_skillpointuse,i,global.guiwidth/2-70,global.guiheight/2-185+(i*50))//Stat level up button
			}
		}
		
		if mouse_check_button_pressed(mb_left){
			if scr_mouseover(global.guiwidth/2-70,global.guiheight/2-185+(0*50),global.guiwidth/2-38,global.guiheight/2-153+(0*50))//HP
			{
			obj_player_stats.maxhpbuff+=10
			obj_player_stats.maxhp=(obj_player_stats.basemaxhp)+((obj_player_stats.basemaxhp/100)*obj_player_stats.maxhpbuff)
			obj_player_stats.maxhpbufflevel+=1
			obj_player_stats.skillpoints-=1
			}
			
			if scr_mouseover(global.guiwidth/2-70,global.guiheight/2-185+(1*50),global.guiwidth/2-38,global.guiheight/2-153+(1*50))//Mana
			{
			obj_player_stats.maxmanabuff+=10
			obj_player_stats.maxmana=(obj_player_stats.basemaxmana)+((obj_player_stats.basemaxmana/100)*obj_player_stats.maxmanabuff)
			obj_player_stats.maxmanabufflevel+=1
			obj_player_stats.skillpoints-=1
			}
			
			if scr_mouseover(global.guiwidth/2-70,global.guiheight/2-185+(2*50),global.guiwidth/2-38,global.guiheight/2-153+(2*50))//Strength
			{
			obj_player_stats.basestrength+=1
		obj_player_stats.	strengthbufflevel+=1
			obj_player_stats.skillpoints-=1
			}
			
			if scr_mouseover(global.guiwidth/2-70,global.guiheight/2-185+(3*50),global.guiwidth/2-38,global.guiheight/2-153+(3*50))//Intelligence
			{
		obj_player_stats.	baseintelligence+=1
		obj_player_stats.	intelligencebufflevel+=1
			obj_player_stats.skillpoints-=1
			}
			
			if scr_mouseover(global.guiwidth/2-70,global.guiheight/2-185+(4*50),global.guiwidth/2-38,global.guiheight/2-153+(4*50))//Luck
			{
		obj_player_stats.	baseluck+=1
		obj_player_stats.	luckbufflevel+=1
			obj_player_stats.skillpoints-=1
			}
		}
		
		draw_text(global.guiwidth/2-120,global.guiheight/2-185+(0*50),"Health +"+string(obj_player_stats.maxhpbuff)+"%")//HP
		draw_text(global.guiwidth/2-120,global.guiheight/2-165+(0*50),"Level:"+string(obj_player_stats.maxhpbufflevel))//HP lvl
		
		draw_text(global.guiwidth/2-120,global.guiheight/2-185+(1*50),"Mana +"+string(obj_player_stats.maxmanabuff)+"%")//Mana
		draw_text(global.guiwidth/2-120,global.guiheight/2-165+(1*50),"Level:"+string(obj_player_stats.maxmanabufflevel))//Mana lvl
		
		draw_text(global.guiwidth/2-120,global.guiheight/2-185+(2*50),"Strength +"+string(obj_player_stats.basestrength))//Mana
		draw_text(global.guiwidth/2-120,global.guiheight/2-165+(2*50),"Level:"+string(obj_player_stats.strengthbufflevel))//Mana lvl
		
		draw_text(global.guiwidth/2-120,global.guiheight/2-185+(3*50),"Intelligence +"+string(obj_player_stats.baseintelligence))//Mana
		draw_text(global.guiwidth/2-120,global.guiheight/2-165+(3*50),"Level:"+string(obj_player_stats.intelligencebufflevel))//Mana lvl
		
		draw_text(global.guiwidth/2-120,global.guiheight/2-185+(4*50),"Luck +"+string(obj_player_stats.baseluck))//Mana
		draw_text(global.guiwidth/2-120,global.guiheight/2-165+(4*50),"Level:"+string(obj_player_stats.luckbufflevel))//Mana lvl
		
		draw_text(global.guiwidth/2-120,global.guiheight/2+120,"Available stat point: "+string(obj_player_stats.skillpoints))
		
		if obj_controller.skillbook_key{
		guistate="isClosed"
		}