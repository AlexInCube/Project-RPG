event_inherited(); //so it will inherit from par_speaker


//-------DIALOGUE STUFF

myPortrait			= spr_portrait;
myVoice				= snd_noone;
myName				= "Трофей";

//-------OTHER
weapon_taked = false

function trophy_gun_furniture() {
	item_gain(item.shotgun,1,global.inventory)
	audio_play_sound(snd_shotgun_prepare,1,0)
	change_variable(obj_trophy_weapon,"weapon_taked",true)
}
