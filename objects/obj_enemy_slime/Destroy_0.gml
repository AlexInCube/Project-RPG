/// @description Insert description here
// You can write your code in this editor

var expr = instance_create_layer(x,y,"Instances",obj_exp)
if random(100)>=50
{
	var loot = instance_create_layer(x,y,"Instances",obj_item)
	loot.whatitem = item.slime
	loot.amount = irandom_range(1,3)
}
expr.expr=irandom_range(1,3)



