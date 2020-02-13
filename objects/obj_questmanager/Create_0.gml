enum quest {
	slime_trouble,
	gotochest
}

var quest_array = [
	[
		"Slime Trouble",
		0,
		["Kill 3 slimes","Deliver 1 slimeball to NPC"]
	],
	[
		"Go to chest",
		-1,
		["GO TO CHEST"]
	],
]

ds_quests = scr_create_ds_grid_from_array(quest_array)
ds_quests_number = ds_grid_height(ds_quests)