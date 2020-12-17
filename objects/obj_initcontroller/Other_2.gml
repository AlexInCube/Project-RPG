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

//Create a ds grid item.total wide, and item_stat.total tall
global.item_index = ds_list_create()
registeritems()