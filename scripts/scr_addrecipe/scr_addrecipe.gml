/// @function scr_addrecipe
/// @param itemtocraft
/// @param component1
/// @param component2
/// @param recipeid

var itemcraft=argument0
var component1=argument1
var component2=argument2
var recipeid=argument3

craft_map[# recipeid,0]=itemcraft
craft_map[# recipeid,1]=component1
craft_map[# recipeid,2]=component2