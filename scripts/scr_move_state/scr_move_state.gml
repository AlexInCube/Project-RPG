

if global.armor_equipped[# 6,0]!=item.none
{
	if obj_controller.attack_key
	{
		script_execute(global.item_index[# global.armor_equipped[# 6,0],item_stat.action_script])
	}
}

if obj_controller.inventory_hotkey1
{
	scr_slot_script_execute(global.inventory,20)
}if obj_controller.inventory_hotkey2
{
	scr_slot_script_execute(global.inventory,21)
}if obj_controller.inventory_hotkey3
{
	scr_slot_script_execute(global.inventory,22)
}if obj_controller.inventory_hotkey4
{
	scr_slot_script_execute(global.inventory,23)
}if obj_controller.inventory_hotkey5
{
	scr_slot_script_execute(global.inventory,24)
}if obj_controller.inventory_hotkey6
{
	scr_slot_script_execute(global.inventory,25)
}if obj_controller.inventory_hotkey7
{
	scr_slot_script_execute(global.inventory,26)
}if obj_controller.inventory_hotkey8
{
	scr_slot_script_execute(global.inventory,27)
}if obj_controller.inventory_hotkey9
{
	scr_slot_script_execute(global.inventory,28)
}if obj_controller.inventory_hotkey10
{
	scr_slot_script_execute(global.inventory,29)
}


if obj_inventory.inventorylock=false{
//get direction
dir = point_direction(0,0,obj_controller.xaxis,obj_controller.yaxis)

if (obj_controller.xaxis == 0 and obj_controller.yaxis == 0){
	len=0
}else{
	len=spd
	scr_get_face(dir)
}


//get hspd and vspd
hspd = lengthdir_x(len,dir)
vspd = lengthdir_y(len,dir)

//move
phy_position_x+=hspd
phy_position_y+=vspd

//control the sprite
image_speed = sign(len)*.4
if(len==0) image_index=0

//vertical sprites

switch(face) {
	case RIGHT:
		sprite_index=spr_player_right
		break
		
	case UP:
		sprite_index=spr_player_up
		break
	
	case LEFT:
		sprite_index=spr_player_left
		break
	
	case DOWN:
		sprite_index=spr_player_down
		break
}


	if obj_controller.interact_key
	{
		if active_textbox == noone
		{
		//TODO: Make an inventory/npc check based on checking the direction the player is looking
		var inst = collision_rectangle(x-findradius,y-findradius,x+findradius,y+findradius,obj_PARENTnpc,false,false)
	
			if inst != noone
			{
				with(inst)
				{
					var tbox = scr_create_textbox(text, speakers, next_line, scripts)
				}
				active_textbox = tbox
			}
		}
		else
		{
			if !instance_exists(active_textbox)
			{
				active_textbox = noone
			}
		}
	}
	
	if obj_controller.pickup_key
	{
		var inst = collision_rectangle(x-findradius,y-findradius,x+findradius,y+findradius,obj_item,false,false)
		with inst
		{
			scr_gain_item(whatitem,amount)
			scr_event_fire(event.itemPickuped)
			instance_destroy()
		}
		
	}
}