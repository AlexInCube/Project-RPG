

if obj_player_stats.attack>0 or obj_player_stats.magicattack>0
{
	if obj_controller.attack_key
	{
		if global.armor_equipped[# 6,0]!=item.none
		{
			var weapontype = global.item_index[# global.armor_equipped[# 6,0],item_stat.type]
			if weapontype = item_type.meleeweapon
			{
				image_index=0
				state = scr_attack_state;
			}
		}
		
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


if obj_inventory.guistate="isClosed"{
//get direction
dir = point_direction(0,0,obj_controller.xaxis,obj_controller.yaxis)

if (obj_controller.xaxis == 0 and obj_controller.yaxis == 0){
	len=0
}else{
	len=spd
	scr_get_face()
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

}