/// @description Insert description here
// You can write your code in this editor
if random(100)>=50
{
	var loot = instance_create_layer(x,y,"Instances",obj_item)
	var itemloot = choose(item.blueleaf,item.greenleaf)
	loot.whatitem = itemloot
	loot.amount = 1
}
