//Default Player State
function move_state() {
	if !instance_exists(obj_textbox){

#region Inventory Key Input
	if obj_controller.inventory_hotkey1
	{
		slot_script_execute(global.inventory,0)
	}if obj_controller.inventory_hotkey2
	{
		slot_script_execute(global.inventory,1)
	}if obj_controller.inventory_hotkey3
	{
		slot_script_execute(global.inventory,2)
	}if obj_controller.inventory_hotkey4
	{
		slot_script_execute(global.inventory,3)
	}if obj_controller.inventory_hotkey5
	{
		slot_script_execute(global.inventory,4)
	}/*if obj_controller.inventory_hotkey6
	{
		slot_script_execute(global.inventory,25)
	}if obj_controller.inventory_hotkey7
	{
		slot_script_execute(global.inventory,26)
	}if obj_controller.inventory_hotkey8
	{
		slot_script_execute(global.inventory,27)
	}if obj_controller.inventory_hotkey9
	{
		slot_script_execute(global.inventory,28)
	}if obj_controller.inventory_hotkey10
	{
		slot_script_execute(global.inventory,29)
	}
*/
#endregion

if obj_controller.xaxis != 0 or obj_controller.yaxis != 0 {
	image_speed=0.4
	//get direction
	dir = point_direction(0,0,obj_controller.xaxis,obj_controller.yaxis)

	//get hspd and vspd
	hspd = lengthdir_x(spd,dir)
	vspd = lengthdir_y(spd,dir)

	//move
	phy_position_x+=hspd*DELTATIME
	phy_position_y+=vspd*DELTATIME
}else{
	image_speed = 0
	image_index = 0
}


	//control the sprite	
	image_xscale = 1
	var mouse_dir = round((point_direction(x,y,mouse_x,mouse_y))div 45)
	mouse_dr = mouse_dir
	switch(mouse_dir) 
	{
		case 0:sprite_index=sprite[RIGHT,MOVE];break
		case 7:sprite_index=sprite[RIGHT,MOVE]; break
				
		case 1:sprite_index=sprite[UP,MOVE];break
		case 2:sprite_index=sprite[UP,MOVE];break
		
		case 3:sprite_index=sprite[LEFT,MOVE]; break
		case 4:sprite_index=sprite[LEFT,MOVE]; break
		
		case 5:sprite_index=sprite[DOWN,MOVE]; break
		case 6:sprite_index=sprite[DOWN,MOVE]; break

	}
	
	//Pickup Items from ground
	if obj_controller.pickup_key
	{
		var inst = collision_rectangle(x-findradius,y-findradius,x+findradius,y+findradius,obj_item,false,false)
		with inst
		{
			item_gain(whatitem,amount,global.inventory)
			event_fire([event.itemPickuped,whatitem,amount])
			instance_destroy()
		}
	}
}
	draw_set_alpha(1)
}
//Using during cutscenes or stun effect
function uncontrollable_state() {
}
//Dash state active after using dash scroll
function dash_state() {
	var dir = mouse_dr*90
	var len = spd*4

	//get hspd and vspd
	hspd = lengthdir_x(len,dir)
	vspd = lengthdir_y(len,dir)

	//move
	phy_position_x+=hspd*DELTATIME
	phy_position_y+=vspd*DELTATIME

	//dash effect
	var dash = instance_create_depth(x,y,1,obj_dash_effect)
	dash.sprite_index = sprite_index
	dash.image_index = image_index
}
//Attack state active if player use melee weapon
function attack_state() {
}