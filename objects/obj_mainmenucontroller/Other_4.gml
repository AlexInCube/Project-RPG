audio_master_gain(global.mastervolume)
audio_group_set_gain(ag_music,global.musicvolume,0)
audio_group_set_gain(ag_sounds,global.soundvolume,0)
audio_play_sound(snd_music1,1,true)
window_set_fullscreen(global.fullscreen)
window_set_size(global.width,global.height)
scr_change_gui_size(global.guisize)
surface_resize(application_surface,global.width,global.height)

alarm[0]=1

cursor_sprite=spr_cursor
window_set_cursor(cr_none)