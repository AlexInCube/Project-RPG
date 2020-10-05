function change_volume(argument0, argument1) {
	var type = argument0
	var volume = argument1
	switch(type){
		case 1: audio_master_gain(volume);global.mastervolume=volume; break;
		case 2: audio_group_set_gain(ag_music,volume,0);global.musicvolume=volume; break;
		case 3: audio_group_set_gain(ag_sounds,volume,0);global.soundvolume=volume; break;
	}


}
