if !instance_exists(obj_textbox){

#region Inventory Key Input
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

#endregion

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
		sprite_index=sprite[RIGHT,MOVE]
		break
		
	case UP:
		sprite_index=sprite[UP,MOVE]
		break
	
	case LEFT:
		sprite_index=sprite[LEFT,MOVE]
		break
	
	case DOWN:
		sprite_index=sprite[DOWN,MOVE]
		break
}


	
	
	if obj_controller.pickup_key
	{
		var inst = collision_rectangle(x-findradius,y-findradius,x+findradius,y+findradius,obj_item,false,false)
		with inst
		{
			scr_gain_item(whatitem,amount)
			instance_destroy()
		}
		
	}
}