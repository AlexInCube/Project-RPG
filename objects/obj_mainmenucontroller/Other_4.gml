audio_master_gain(global.mastervolume)
audio_group_set_gain(ag_music,global.musicvolume,0)
audio_group_set_gain(ag_sounds,global.soundvolume,0)
audio_play_sound(snd_music1,1,true)