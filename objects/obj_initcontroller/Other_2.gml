/// @description Insert description here
// You can write your code in this editor
if !audio_group_is_loaded(ag_music)
   {
   audio_group_load(ag_music);
   }
   
if !audio_group_is_loaded(ag_sounds)
   {
   audio_group_load(ag_sounds);
   }





if global.fullscreen=true{
window_set_fullscreen(true)
}

scr_localizationload()

//Create a ds grid item.total wide, and item_stat.total tall
global.item_index = ds_grid_create(item.total, item_stat.total);
ds_grid_clear(global.item_index, 0); //Set every position to 0
scr_registeritems()

scr_initrecipes()