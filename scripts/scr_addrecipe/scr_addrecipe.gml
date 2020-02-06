/// @function scr_addrecipe
/// @param itemtocraft
/// @param component1
/// @param component1amount
/// @param component2
/// @param component2amount
/// @param itemsoutput


var itemcraft=argument0
var component1=argument1
var component1amount=argument2
var component2=argument3
var component2amount=argument4
var itemsoutput=argument5
var recipeid=ds_grid_width(global.craft_map)
ds_grid_resize(global.craft_map,ds_grid_width(global.craft_map)+1,6)
global.craft_map[# recipeid,0]=itemcraft
global.craft_map[# recipeid,1]=component1
global.craft_map[# recipeid,2]=component1amount
global.craft_map[# recipeid,3]=component2
global.craft_map[# recipeid,4]=component2amount
global.craft_map[# recipeid,5]=itemsoutput

