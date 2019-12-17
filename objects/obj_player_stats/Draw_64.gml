/// @description Insert description here
// You can write your code in this editor
draw_set_font(fnt_main)
draw_set_color(c_black)
draw_text(32,32,"Health: "+string(hp) + "/" + string(maxhp))
draw_text(32,64,"Mana: "+string(mana) + "/" + string(maxmana))
draw_text(32,96,"Level: "+string(level))



switch guistate{
	case "isClosed":{
		if obj_controller.skillbook_key{
		guistate="isOpen"
		obj_inventory.guistate="isClosed"
		}
		break
	}
	case "isOpen":{
		scr_draw_black_screen()
		draw_sprite(spr_skillbook,0,global.width/2,global.height/2)//Stat Manu Background
		for (i=0;i<5;i++)
		{
			draw_sprite(spr_skills,i,global.width/2-252,global.height/2-185+(i*50))//Stat Icons
			if skillpoints>0
			{
				draw_sprite(spr_skillpointuse,i,global.width/2-70,global.height/2-185+(i*50))//Stat level up button
			}
		}
		
		if mouse_check_button_pressed(mb_left){
			if scr_mouseover(global.width/2-70,global.height/2-185+(0*50),global.width/2-38,global.height/2-153+(0*50))//HP
			{
			maxhpbuff+=10
			maxhp=(basemaxhp)+((basemaxhp/100)*maxhpbuff)
			maxhpbufflevel+=1
			skillpoints-=1
			}
			
			if scr_mouseover(global.width/2-70,global.height/2-185+(1*50),global.width/2-38,global.height/2-153+(1*50))//Mana
			{
			maxmanabuff+=10
			maxmana=(basemaxmana)+((basemaxmana/100)*maxmanabuff)
			maxmanabufflevel+=1
			skillpoints-=1
			}
			
			if scr_mouseover(global.width/2-70,global.height/2-185+(2*50),global.width/2-38,global.height/2-153+(2*50))//Strength
			{
			basestrength+=1
			strengthbufflevel+=1
			skillpoints-=1
			}
			
			if scr_mouseover(global.width/2-70,global.height/2-185+(3*50),global.width/2-38,global.height/2-153+(3*50))//Intelligence
			{
			baseintelligence+=1
			intelligencebufflevel+=1
			skillpoints-=1
			}
			
			if scr_mouseover(global.width/2-70,global.height/2-185+(4*50),global.width/2-38,global.height/2-153+(4*50))//Luck
			{
			baseluck+=1
			luckbufflevel+=1
			skillpoints-=1
			}
		}
		
		draw_text(global.width/2-200,global.height/2-185+(0*50),"Health +"+string(maxhpbuff)+"%")//HP
		draw_text(global.width/2-200,global.height/2-165+(0*50),"Level:"+string(maxhpbufflevel))//HP lvl
		
		draw_text(global.width/2-200,global.height/2-185+(1*50),"Mana +"+string(maxmanabuff)+"%")//Mana
		draw_text(global.width/2-200,global.height/2-165+(1*50),"Level:"+string(maxmanabufflevel))//Mana lvl
		
		draw_text(global.width/2-200,global.height/2-185+(2*50),"Strength +"+string(basestrength))//Mana
		draw_text(global.width/2-200,global.height/2-165+(2*50),"Level:"+string(strengthbufflevel))//Mana lvl
		
		draw_text(global.width/2-200,global.height/2-185+(3*50),"Intelligence +"+string(baseintelligence))//Mana
		draw_text(global.width/2-200,global.height/2-165+(3*50),"Level:"+string(intelligencebufflevel))//Mana lvl
		
		draw_text(global.width/2-200,global.height/2-185+(4*50),"Luck +"+string(baseluck))//Mana
		draw_text(global.width/2-200,global.height/2-165+(4*50),"Level:"+string(luckbufflevel))//Mana lvl
		
		draw_text(global.width/2-120,global.height/2+150,"Available stat point: "+string(skillpoints))
		
		if obj_controller.skillbook_key{
		guistate="isClosed"
		}
		break
	}
}

