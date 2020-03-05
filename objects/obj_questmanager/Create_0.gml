enum quest{
	slimetrouble,
	testdeliver
}

enum questtype {
	kill,
	trigger,
	talk,
	craft,
	deliver
}

notificationquestname=""
notificationqueststate=-1
notificationtime=180
txtalpha=0
txtcolor=c_orange

ds_quests = ds_grid_create(0,0)
#region slimetrouble
scr_add_quest(
[
	-1,//Current Stage, -1 not started, 0 started.
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
#region kirilloxuel
scr_add_quest(
[
	-1,//Current Stage, -1 not started, 0 started.
	"delivertest",//Quest name
	"Это такое информативное описание всего задания, тут может описан сам квест, лор и бла бла бла.",//Total quest decription
	[//Short decription of each stage
		"Сдайте слизь",
		"Сдайте слизь",
		"Сдайте слизь",
		"Сдайте слизь"
	],
	[//Decription of each stage
		"Сдайте слизь",
		"Сдайте слизь",
		"Сдайте слизь",
		"Сдайте слизь"
	],
	[//Stage requirements
		[questtype.deliver,item.slime,1],
		[questtype.deliver,item.slime,1],
		[questtype.deliver,item.slime,1],
		[questtype.deliver,item.slime,1]
	]
]
)
#endregion
//scr_quest_start(quest.slimetrouble)
//scr_quest_start(quest.testdeliver)