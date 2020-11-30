event_inherited()
if random(100)>=50
{
	var loot = instance_create_layer(x,y,"Instances",obj_item)
	loot.whatitem = item.slime
	loot.amount = irandom_range(1,3)
}
get_exp(irandom_range(4,5))


