if !audio_group_is_loaded(ag_music)
   {
   audio_group_load(ag_music);
   }
   
if !audio_group_is_loaded(ag_sounds)
   {
   audio_group_load(ag_sounds);
   }

show_debug_message("myGMLib Loaded: "+string(gmlib_link_test()))

localization_load()

registeritems()
registereffects()
registerquests()