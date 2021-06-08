// Inherit the parent event
event_inherited();

myVoice				= snd_voice4;
myName				= "Евген";
myPortrait			= spr_portrait_ewgen

choice_variable		= -1;

function wait_water(){
	quest_start("help_for_ewgen")
	item_gain("money",1)
	with (obj_ewgennpc){
		choice_variable = "wait_water"
	}
}

function drink_water(){
	story_tag_add("help_ewgen_with_water")
	item_grab("wooden_water_bucket",1,global.inventory)
	with (obj_ewgennpc){
		choice_variable = "drink_water"
	}
}