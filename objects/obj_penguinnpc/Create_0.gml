event_inherited(); //so it will inherit from par_speaker


//-------DIALOGUE STUFF

myPortrait			= spr_penguinportrait;
myVoice				= snd_voice6;
myName				= "Васян";

//-------OTHER

choice_variable		= 0;	//the variable we change depending on the player's choice in dialogue
phy_fixed_rotation=true

sprite[RIGHT,MOVE] = spr_penguin_right
sprite[UP,MOVE] = spr_penguin_up
sprite[LEFT,MOVE] = spr_penguin_left
sprite[DOWN,MOVE] = spr_penguin_down

function penguin_not_wait(){
	change_variable(obj_penguinnpc,"choice_variable",-1)
	with(obj_cutscene){
		cutscene_end_action()
	}
}

function angry_penguin(){
	instance_create_layer(x,y,"Instances",obj_enemy_penguin)
	instance_destroy(obj_penguinnpc)
}