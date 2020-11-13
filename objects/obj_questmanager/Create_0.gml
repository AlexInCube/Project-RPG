//Quest List
enum quest{
	slimetrouble
}

//Quest Types
enum questtype {
	kill,
	trigger,
	talk,
	craft,
	deliver
}
ds_quests = ds_grid_create(0,0)//Width - quest details, Height - quest id
global.ds_current_quests = ds_map_create()//List of active quests (store the ID and Progress)


//Quest data
#region slimetrouble
add_quest(
[
	"Проблема со слизнями",//Quest name
	"Это такое информативное описание всего задания, тут может описан сам квест, лор и бла бла бла.",//Total quest decription
	[//Short decription of each stage
		"Убить трёх слизней",
		"Прийти обратно к Никите",
		"Поговорить с Никитой",
		"Отдать одну слизь"
	],
	[//Decription of each stage
		"Мне так надоели эти слизни, просто убей их. Да всё так просто, делай молча.",
		"Вернитесь к Никите",
		"Поговорите с ним",
		"Дайте Никите слизь"
	],
	[//Stage requirements
		[questtype.kill,obj_enemy_slime,3],
		[questtype.trigger,"playernearnikita"],
		[questtype.talk,obj_nikitanpc],
		[questtype.deliver,item.slime,1],
	]
]
)
#endregion

//quest_update(quest.slimetrouble)

//For notification about start/fail/complete quest
notificationquestname=""
notificationqueststate=-1
notificationtime=180
txtalpha=0
txtcolor=c_orange
//Display quest which player want to track
tracking_quest=noone
tracking_update(tracking_quest)