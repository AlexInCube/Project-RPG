event_inherited(); //so it will inherit from par_speaker


//-------DIALOGUE STUFF

myPortrait			= spr_nikitaportrait;
myVoice				= snd_voice5;
myName				= "Никита";

//-------OTHER

choice_variable		= -1;	//the variable we change depending on the player's choice in dialogue

function slimetrouble_to_give_slime(argument0) {
	var choice = argument0//if 0 give coin, if 1 give salve, if 2 for placeholder
	item_grab(item.slime,1,global.inventory)
	if choice == 0
	{
		item_gain(item.coin,1,global.inventory)
	}
	else if choice == 1
	{
		item_gain(item.star_salve,1,global.inventory)
	}

	change_variable(obj_nikitanpc,"choice_variable","nikita_thanks_for_help")
}

function slimetrouble_nikita_take_displasure() {
	change_variable(obj_nikitanpc,"choice_variable","nikita_obizhen")
	quest_failed(quest.slimetrouble)
}
