/// @description Insert description here
// You can write your code in this editor


if audio_group_is_loaded(ag_music)
{
	
	audio_group_set_gain(ag_music,global.musicvolume,0)
}

if audio_group_is_loaded(ag_sounds)
{
	audio_group_set_gain(ag_sounds,global.soundvolume,0)
}

