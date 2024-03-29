depth=-bbox_bottom
//-----------Customise (FOR USER)
playerobject = obj_player;
interact_radius = 32;

myVoice			= snd_voice;
myPortrait		= spr_portrait;
myFont			= fnt_small;
myName			= "None";

//-----------Defaults Setup (LEAVE THIS STUFF)
reset_dialogue_defaults();

function interact(){
	if(myTextbox != noone){ 
				if(!instance_exists(myTextbox)){ myTextbox = noone; exit; }
			}
			//if I haven't already created my textbox, make one:
			else if obj_inputManager.interact_key{
				if(instance_exists(obj_textbox)){ exit; }	//exit if a textbox already exists
				event_user(0);								//if you need variables to update for text
			
				//Hand over variables
				create_dialogue(myText, mySpeaker, myTypes, myNextLine, myScripts, myEmotion, myTime);
				obj_inventory.inventorylock=true
				obj_player.image_speed=0
				obj_player.image_index=0
				event_fire(EVENT_NPC_TALK,{npc_obj : object_index})
			}	else {	//if player moves outside of detection radius
			if(myTextbox != noone){
				with(myTextbox) instance_destroy();
				myTextbox = noone;
			}
		}
	}



