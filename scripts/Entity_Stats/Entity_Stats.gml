function Stat(baseVal){
	baseValue = baseVal
	
	modifiers = [
	
	]
}

function Entity_Stats(){
	max_hp = 3
	hp = max_hp
	phys_armor = 0
	magic_armor = 0
	
	energy=0//Increase max_mana
	max_mana=0
	mana=max_mana

	defense=0//Gain phys and magic armor, also increase max_hp
	phys_armor=0
	magic_armor=0

	strength=0//Gain phys and magic damage
	phys_damage=0
	magic_damage=0

	agility=0//Gain evasion and hp/mp regen amount (for example potion heal 1*agility hp)
	evasion=0
	regen_amount=0
}