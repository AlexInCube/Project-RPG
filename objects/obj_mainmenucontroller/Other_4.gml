audio_master_gain(global.settings.audio.mastervolume)
audio_group_set_gain(ag_music,global.settings.audio.musicvolume,0)
audio_group_set_gain(ag_sounds,global.settings.audio.soundvolume,0)
audio_play_sound(snd_music1,1,true)
window_set_fullscreen(global.settings.video.fullscreen)
window_set_size(global.settings.video.width,global.settings.video.height)
change_gui_size(global.settings.interface.guisize)
surface_resize(application_surface,global.settings.video.width,global.settings.video.height)

alarm[0]=1

cursor_sprite=spr_cursor
window_set_cursor(cr_none)