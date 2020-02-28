enum quest{
	slimetrouble,
	kirilloxuel
}

enum questtype {
	kill,
	deliver,
	trigger,
	escort,
	craft,
	talk
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
		"Прийти обратно к пингвину",
		"Поговорить с пингвином",
		"Отдать ему 1 слизневый шар"
	],
	[//Decription of each stage
		"Мне так надоели эти слизни, просто убей их. Да всё так просто, делай молча.",
		"Вернитесь к пингвину",
		"Поговорите с ним",
		"Дайте ему этот грёбаный шар"
	],
	[//Stage requirements
		[questtype.kill,obj_enemy_slime,3],
		[questtype.trigger,"playernearpenguin"],
		[questtype.talk,obj_nikitanpc],
		[questtype.deliver,item.slime],
	]
]
)
#endregion
#region kirilloxuel
scr_add_quest(
[
	-1,//Current Stage, -1 not started, 0 started.
	"Меры против Кирилла",//Quest name
	"Это такое информативное описание всего задания, тут может описан сам квест, лор и бла бла бла.",//Total quest decription
	[//Short decription of each stage
		"Найдите Кирилла",
		"Убейте Кирилла",
	],
	[//Decription of each stage
		"Киря проиграл ZXC и должен умереть за это, найдите его и убейте.",
		"Ты не тормози, закончи это, убей КИРЮ.",
	],
	[//Stage requirements
		[questtype.trigger,room_world1A,127,212],
		[questtype.kill,obj_enemy_slime,3],
	]
]
)
#endregion
scr_quest_start(quest.slimetrouble)
//scr_quest_start(quest.kirilloxuel)
