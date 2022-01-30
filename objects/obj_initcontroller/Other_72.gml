	if audio_group_is_loaded(ag_music)
	{
		audio_group_set_gain(ag_music,global.settings.audio.musicvolume,0)
		console_log("[ Audio ] " + "Group Music is loaded")
	}

	if audio_group_is_loaded(ag_sounds)
	{
		audio_group_set_gain(ag_sounds,global.settings.audio.soundvolume,0)
		console_log("[ Audio ] " + "Group Sounds is loaded")
	}

