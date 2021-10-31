///@function create_cutscene(array_cutscene)
///@param array_cutscene
/*
	Array provided what cutscene must be do
	For example:
	t_scene_info = 
	[
		[cutscene_change_variable,obj_player,"state",uncontrollable_state],
		[cutscene_wait,0.2],
		[cutscene_set_to_default]
	]
*/
function create_cutscene(argument0) {
	var inst = instance_create_layer(0,0,"Instances",obj_cutscene)
	with(inst){
		scene_info = argument0
		event_perform(ev_other,ev_user0)
	}
}

///@function cutscene_end_action
/*
	Put this script in other actions to	mark end of action
*/
function cutscene_end_action() {
	scene++
	if (scene > array_length(scene_info)-1){
		instance_destroy()
		exit
	}

	event_perform(ev_other,ev_user0)
}

///@function cutscene_set_to_default
///@description Put this in the end of actions array for return control to the player
function cutscene_set_to_default() {
	change_camera_mode(camera_mode.move_to_follow_object,obj_player,0.1)
	cutscene_change_interface_state(false)
	obj_player.state=move_state
		
	cutscene_end_action()
}

///@function cutscene_wait
///@arg ticks
function cutscene_wait(ticks) {
	timer = timer + (1* DELTATIME)

	if(timer >= ticks){
		timer = 0
		cutscene_end_action()
	}
}

///@function cutscene_script_execute
///@arg scr
///@arg [args]
function cutscene_script_execute(scr,args) {
	script_execute_ext(scr,args)
	cutscene_end_action()
}

///@description cutscene_play_sound
///@arg soundid
///@arg priority
///@arg loops
function cutscene_play_sound(argument0, argument1, argument2) {
	audio_play_sound(argument0,argument1,argument2)
	cutscene_end_action()
}

///@description cutscene_instance_create
///@arg x
///@arg y
///@arg layer
///@arg obj
function cutscene_instance_create(argument0, argument1, argument2, argument3) {
	var inst = instance_create_layer(argument0,argument1,argument2,argument3)

	cutscene_end_action()

	return inst
}

///@description cutscene_instance_destroy
///@arg id
function cutscene_instance_destroy(argument0) {
	with(argument0){
		instance_destroy()
	}
	
	cutscene_end_action()
}

///@description cutscene_change_state
///@arg obj_id
///@arg state_script
function cutscene_change_state(argument0, argument1) {
	with(argument0){
		state = argument1
	}

	cutscene_end_action()
}

///@description
///@arg obj
///@arg var_name_as_string
///@arg value
function cutscene_change_variable(argument0, argument1, argument2) {
	with(argument0){
		variable_instance_set(id, argument1, argument2)
	}

	cutscene_end_action()
}

///@description
///@arg obj
///@arg var_name_as_string
///@arg value
function cutscene_take_player_control() {
	with(obj_player){
		state = uncontrollable_state
		image_index = 0
		image_speed = 0
	}

	cutscene_end_action()
}
///@description
///@arg true = off, false = on
function cutscene_change_interface_state(state) {
	global.interface_lock_by_game = state

	cutscene_end_action()
}

///@description move_character
///@arg obj
///@arg x
///@arg y
///@arg relative?
///@arg spd
function cutscene_move_character(obj, x, y, relative, spd) {
	if (x_dest == -1){
		if(!relative){
			x_dest = x
			y_dest = y
		}else{
			x_dest = obj.phy_position_x+x
			y_dest = obj.phy_position_y+y
		}
	}

	var xx = x_dest, yy = y_dest

	with(obj){
		if point_distance(phy_position_x,phy_position_y,xx,yy)>=spd{
			var dir = point_direction(phy_position_x,phy_position_y,xx,yy)
			var ldirx = lengthdir_x(spd,dir)
			var ldiry = lengthdir_y(spd,dir)
		
			phy_position_x += ldirx*DELTATIME
			phy_position_y += ldiry*DELTATIME
		
			
			image_speed = sign(spd)*.4
				switch(dir) {
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
		}else{
			phy_position_x = xx
			phy_position_y = yy
			image_speed = 0
			with(other){
				x_dest = -1
				y_dest = -1
				cutscene_end_action()
			}
		}
	

	}


}

///@description cutscene_change_camera_mode
///@arg	mode
///@arg camera_speed
///@arg following/target_x
///@arg target_y
function cutscene_camera_change_mode() {
	with(obj_camera){
		mode = argument[0]
		camera_speed = argument[1]
		switch(mode){
			case camera_mode.move_to_target:
				target_x = argument[2]
				target_y = argument[3]
			break
			
			case camera_mode.follow_object:
			case camera_mode.move_to_follow_object:
				following = argument[2]
			break
		}
	}

	cutscene_end_action()
}

///@description cutscene_stop_sound
///@arg soundid
function cutscene_stop_sound(argument0) {
	audio_stop_sound(argument0)

	cutscene_end_action()


}

///@description cutscene_create_monologue
///@arg Text
function cutscene_create_monologue(argument0) {
	if !instance_exists(obj_cutscene_speaker){
		var inst = instance_create_layer(0,0,"Text",obj_cutscene_speaker)
		inst.myText = argument0
		with (inst){
			create_dialogue(myText, obj_player);
		}
	}else if !instance_exists(obj_textbox){
		instance_destroy(obj_cutscene_speaker)
		cutscene_end_action()
	}
}

///@description cutscene_event_perform
///@arg object_id
///@arg event_type
///@arg event_number
function cutscene_event_perform(argument0, argument1, argument2) {
	with(argument0){
	event_perform(argument1,argument2)
	}
	cutscene_end_action()


}

///@description cutscene_start_speak
///@arg object_id
///@arg instant_end?
function cutscene_start_speak(object_id,instant_end) {
if !instance_exists(obj_textbox) and !instance_exists(obj_textevent){
		with(object_id){
			event_user(0)
			create_dialogue(myText, mySpeaker, myEffects, myTextSpeed, myTypes, myNextLine, myScripts, myTextCol, myEmotion);
			obj_inventory.inventorylock=true
			obj_player.image_speed=0
			obj_player.image_index=0
			event_fire(EVENT_NPC_TALK,{npc_obj : object_index})
		}
	}
	if instant_end{
		cutscene_end_action()
	}
}
