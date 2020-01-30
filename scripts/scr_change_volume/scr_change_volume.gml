var type = menu_option[page]
var volume = argument0
switch(type){
	case 0: audio_master_gain(volume);global.mastervolume=volume; break;
	case 1: audio_group_set_gain(ag_music,volume,0);global.musicvolume=volume; break;
	case 2: audio_group_set_gain(ag_sounds,volume,0);global.soundvolume=volume; break;
}