function scr_move_state() {
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
if obj_controller.xaxis != 0 or obj_controller.yaxis != 0 {
	image_speed=0.4
	//get direction
	dir = point_direction(0,0,obj_controller.xaxis,obj_controller.yaxis)

	//get hspd and vspd
	hspd = lengthdir_x(spd,dir)
	vspd = lengthdir_y(spd,dir)

	//move
	phy_position_x+=hspd
	phy_position_y+=vspd
}else{
	image_speed = 0
	image_index = 0
}
	//control the sprite	
	image_xscale = 1
	var mouse_dir = point_direction(phy_position_x,phy_position_y,mouse_x,mouse_y) div 45
	show_debug_message(mouse_dir)
	switch(mouse_dir) {
		case 0:sprite_index=sprite[RIGHT,MOVE];break
		case 1:sprite_index=sprite[UPRIGHT,MOVE];break
		case 2:sprite_index=sprite[UP,MOVE];break
		case 3:sprite_index=sprite[UPRIGHT,MOVE]; image_xscale =-1; break
		case 4:sprite_index=sprite[RIGHT,MOVE]; image_xscale =-1; break
		case 5:sprite_index=sprite[DOWNRIGHT,MOVE]; image_xscale =-1; break
		case 6:sprite_index=sprite[DOWN,MOVE]; break
		case 7:sprite_index=sprite[DOWNRIGHT,MOVE]; break
	}

	//Pickup Items from ground
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


}
