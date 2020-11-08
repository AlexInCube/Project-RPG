reset_dialogue_defaults();

change_camera_mode(camera_mode.move_to_follow_object,id)
switch(choice_variable){
	case -1:
	#region First Dialogue
		//Line 0
		var i = 0;
		myText[i]		= "Ты кто такой?";
		mySpeaker[i]	= id;
		
		//Line 1
		i++;
		myText[i]		= ["Сказать своё имя","Уйти"];
		myTypes[i]		= 1;
		mySpeaker[i]	= obj_player;
		myNextLine[i]	= [2,-1];
		
		//Line 2
		i++;
		myText[i]		= string(obj_player.myName)+", выполнишь для меня пару заданий и мы в расчёте.";
		mySpeaker[i]	= id;
		
		//Line 3
		i++;
		myText[i]		= "Мне уже надоели эти слизни, они всё время бегают возле меня и хотят лизнуть";
		mySpeaker[i]	= id;
		

		//Line 4
		i++;
		myText[i]		= ["Почему бы тебе просто не уйти отсюда, туда где нет слизней?","Ну, допустим я могу убить их."];
		myTypes[i]		= 1
		mySpeaker[i]	= obj_player
		myNextLine[i]	= [5,10]
		myScripts[i]	= [[nothing],[quest_update,quest.slimetrouble]]
		

		//Line 5
		i++;
		myText[i]		= "Уйти оттуда, где ты стоишь всё время. Ты думаешь это так просто?";
		myEmotion[i]	= 0;
		mySpeaker[i]	= id;
		

		//Line 6
		i++;
		myText[i]		= ["Да, просто передвинь ноги", "Нет, покинуть то к чему привык не просто."];
		myTypes[i]		= 1;
		myNextLine[i]	= [7,8];
		mySpeaker[i]	= obj_player;

		//Line 7
		i++;
		myText[i]		= "ВСЁ, Я С ТОБОЙ НЕ РАЗГОВАРИВАЮ, ПРОВАЛИВАЙ.";
		myNextLine[i]	= -1;
		mySpeaker[i]	= id;
		myScripts[i]	= [slimetrouble_nikita_take_displasure]

		//Line 8
		i++;
		myText[i]		= "Правильно говоришь, так ты поможешь мне со слизнями?";
		mySpeaker[i]	= id;
		
		//Line 9
		i++;
		myText[i]		= ["Помогу","Нет"];
		myTypes[i]		= 1;
		myNextLine[i]   = [10,7]
		myScripts[i]	= [[quest_update,quest.slimetrouble],[nothing]]
		mySpeaker[i]	= id;
		
		//Line 10
		i++;
		myText[i]		= "Для начала убей трёх слизней."
		mySpeaker[i]	= id;
		myScripts[i]	= [change_variable,id,"choice_variable","nikita_wait_3_kills"]
		#endregion
	break;
	
	case "nikita_obizhen":
	#region If nikite obizhen
		var i = 0;
		//Line 0
		myText[i]		= "УЙДИ, Я НЕ ХОЧУ ТЕБЯ БОЛЬШЕ ВИДЕТЬ.";
		mySpeaker[i]	= id;
	
	#endregion
	break;
	
	case "nikita_wait_3_kills":
	#region Nikita wait realization of third stage of quest
		var i = 0;
		
		if quest_get_current_stage(quest.slimetrouble) >= 2{
		//Line 0 //If task complete
		myText[i]		= "Я видел как ты с ними справился, мог и быстрее их убить";
		myEmotion[i]	= 1;
		myNextLine[i]	= 1
		mySpeaker[i]	= id;
		} else {
		//Line 0 //If task still incomplete
		
		myText[i]		= "Ты до сих пор не убил трёх слизней, ало, зачем пришёл?";
		myEmotion[i]	= 1;
		myNextLine[i]	= -1
		mySpeaker[i]	= id;
		}
		//Line 1
		i++
		myText[i]		= ["У меня плохое оружие","Мне всё равно как их убивать, тебе что-то надо ещё или я могу уйти?"];
		myTypes[i]		= 1
		myNextLine[i]	= [2,14]
		mySpeaker[i]	= obj_player
		//Line 2
		i++
		myText[i]		= "Да я бы с ними и без оружия справился бы.";
		mySpeaker[i]	= id;
		//Line 3 
		i++
		myText[i]		= ["И как же?","Порассказывай мне тут"];
		myTypes[i]		= 1
		myNextLine[i]	= [4,15]
		mySpeaker[i]	= obj_player
		//Line 4
		i++
		myText[i]		= "Я бы их своим телом расскатал бы, видишь какой я большой?";
		mySpeaker[i]	= id;
		//Line 5
		i++
		myText[i]		= ["Я бы на это посмотрел.","Ты такой же ростом как я, только жирный."];
		myNextLine[i]	= [6,8]
		myTypes[i]		= 1
		mySpeaker[i]	= obj_player;
		//Line 6
		i++
		myText[i]		= "А я не хочу пачкаться, поэтому я поручил эту грязную работёнку тебе.";
		mySpeaker[i]	= id;
		//Line 7
		i++
		myText[i]		= "Мы вообще начали с того, что ты говоришь, что у тебя плохое оружие. Иди к кузнецу Евгену, он тебе что-нибудь сделает.";
		myNextLine[i]	= 11
		mySpeaker[i]	= id;
		//Line 8
		i++
		myText[i]		= "Я НЕ ЖИРНЫЙ, У МЕНЯ КОСТЬ БОЛЬШАЯ!!!";
		mySpeaker[i]	= id;
		//Line 9
		i++
		myText[i]		= ["Успокойся","*посмеяться*"];
		myNextLine[i]	= [7,-1]
		myTypes[i]		= 1
		mySpeaker[i]	= id;
		myScripts[i]	= [[nothing],[slimetrouble_nikita_take_displasure]]
		//Line 10
		i++
		myText[i]		= "Пойди потом к кузнецу Евгену, он тебе что-нибудь сделает.";
		mySpeaker[i]	= id;
		//Line 11
		i++
		myText[i]		= ["Где его найти?","Сам найду как-нибудь"];
		myNextLine[i]	= [12,13]
		myTypes[i]		= 1
		mySpeaker[i]	= obj_player;
		//Line 12
		i++
		myText[i]		= "Он работает в Деревне дураков"
		mySpeaker[i]	= id;
		//Line 13
		i++
		myText[i]		= "Ладно, найдёшь скажешь."
		mySpeaker[i]	= id;
		//Line 14
		i++
		myText[i]		= "Можешь дать мне слизь?"
		myNextLine[i]	= 16
		mySpeaker[i]	= id;
		//Line 15
		i++
		myText[i]		= "Ты что не веришь мне?"
		myNextLine[i]	= 4
		mySpeaker[i]	= id;
		//Line 16
		i++
		myText[i]		= ["У меня нет слизи","У меня есть слизь, но я тебе её не дам.","Зачем она тебе?","Забирай"];
		myNextLine[i]	= [17,18,20,29]
		myTypes[i]		= 1
		mySpeaker[i]	= obj_player;
		//Line 17
		i++
		myText[i]		= "Тогда иди поубивай ещё слизней"
		myNextLine[i]	= -1
		myScripts[i]	= [change_variable,id,"choice_variable","nikita_wait_1_slimeball"]
		mySpeaker[i]	= id;
		//Line 18
		i++
		myText[i]		= "Ага и почему же ты мне её не дашь?"
		mySpeaker[i]	= id;
		//Line 19
		i++
		myText[i]		= ["Я хочу оставить её себе","Я не знаю для чего она тебе нужна"];
		myNextLine[i]	= [22,20]
		myTypes[i]		= 1
		mySpeaker[i]	= obj_player;
		//Line 20
		i++
		myText[i]		= "Она мне нужна для..."
		mySpeaker[i]	= id;
		//Line 21
		i++
		myText[i]		= "А вообщем не важно."
		mySpeaker[i]	= id;
		//Line 22
		i++
		myText[i]		= "Может договоримся?"
		mySpeaker[i]	= id;
		//Line 23
		i++
		myText[i]		= ["Что ты можешь мне предложить?","Я оставлю слизь себе"];
		myNextLine[i]	= [24,25]
		myTypes[i]		= 1
		mySpeaker[i]	= obj_player;
		//Line 24
		i++
		myText[i]		= "Я дам тебе мазь или монетку в обмен на слизь"
		myNextLine[i]	= 26
		mySpeaker[i]	= id;
		//Line 25
		i++
		myText[i]		= "Ну и вали отсюда."
		myNextLine[i]	= -1
		mySpeaker[i]	= id;
		myScripts[i]	= [change_variable,id,"choice_variable","player_was_greedy"]
		//Line 26
		i++
		myText[i]		= ["Я согласен на мазь","Я согласен на монетку","Я лучше оставлю слизь себе","Что за мазь?"]
		myNextLine[i]	= [27,28,25,29]
		myTypes[i]		= 1
		mySpeaker[i]	= obj_player;
		//Line 27
		i++
		myText[i]		= "Отлично, забирай мазь."
		myNextLine[i]	= -1
		mySpeaker[i]	= id;
		myScripts[i]	= [slimetrouble_to_give_slime,1]
		//Line 28
		i++
		myText[i]		= "Отлично, забирай монетку."
		myNextLine[i]	= -1
		mySpeaker[i]	= id;
		myScripts[i]	= [slimetrouble_to_give_slime,0]
		//Line 29
		i++
		myText[i]		= "Звёздочка"
		myNextLine[i]	= 26
		mySpeaker[i]	= id;
		//Line 30
		i++
		myText[i]		= "Спасибо"
		myNextLine[i]	= -1
		mySpeaker[i]	= id;
		myScripts[i]	= [slimetrouble_to_give_slime,2]
		
		//uncommenting this will make the first conversation begin again
		//choice_variable	= -1;
	#endregion
	break;
	
	case "nikita_wait_1_slimeball":
	#region Nikita wait slimeball from player
		var i = 0;
		//Line 0
		myText[i]		= "Так ты добыл слизь?";
		mySpeaker[i]	= id;
		
		//Line 1
		i++;
		myText[i]		= ["Да","Нет"];
		myTypes[i]		= 1;
		mySpeaker[i]	= obj_player;
		myNextLine[i]	= [3,2];
		//Line 2
		i++
		myText[i]		= "Не трать время, иди добывать мне слизь.";
		myNextLine[i]	= -1
		mySpeaker[i]	= id;
		//Line 3
		i++
		myText[i]		= "Покажи";
		mySpeaker[i]	= id;
		//Line 4
		i++
		if check_requirement_item(global.inventory,item.slime,1){
		myText[i]		= ["Показать","Ладно, я её не добыл."];
		myNextLine[i]	= [5,2]
		}else{
		myText[i]		= ["Ладно, я её не добыл."];
		myNextLine[i]	= [2]
		}
		myTypes[i]		= 1
		mySpeaker[i]	= obj_player;
		//Line 5
		i++
		myText[i]		= "Давай её мне"
		mySpeaker[i]	= id;
		//Line 6
		i++
		myText[i]		= ["Я тебе её не дам.","Зачем она тебе?","Забирай"];
		myNextLine[i]	= [7,9,19]
		myTypes[i]		= 1
		mySpeaker[i]	= obj_player;
		//Line 7
		i++
		myText[i]		= "Ага и почему же ты мне её не дашь?"
		mySpeaker[i]	= id;
		//Line 8
		i++
		myText[i]		= ["Я хочу оставить её себе","Я не знаю для чего она тебе нужна"];
		myNextLine[i]	= [11,9]
		myTypes[i]		= 1
		mySpeaker[i]	= obj_player;
		//Line 9
		i++
		myText[i]		= "Она мне нужна для..."
		mySpeaker[i]	= id;
		//Line 10
		i++
		myText[i]		= "А вообщем не важно."
		mySpeaker[i]	= id;
		//Line 11
		i++
		myText[i]		= "Может договоримся?"
		mySpeaker[i]	= id;
		//Line 12
		i++
		myText[i]		= ["Что ты можешь мне предложить?","Я оставлю слизь себе"];
		myNextLine[i]	= [13,14]
		myTypes[i]		= 1
		mySpeaker[i]	= obj_player;
		//Line 13
		i++
		myText[i]		= "Я дам тебе мазь в обмен на слизь или дам монетку."
		myNextLine[i]	= 15
		mySpeaker[i]	= id;
		//Line 14
		i++
		myText[i]		= "Ну и вали отсюда."
		myNextLine[i]	= -1
		mySpeaker[i]	= id;
		myScripts[i]	= [change_variable,id,"choice_variable","player_was_greedy"]
		//Line 15
		i++
		myText[i]		= ["Я согласен на мазь","Я согласен на монетку","Я лучше оставлю слизь себе","Что за мазь?"]
		myNextLine[i]	= [16,17,14,18]
		myTypes[i]		= 1
		mySpeaker[i]	= obj_player;
		//Line 16
		i++
		myText[i]		= "Отлично, забирай мазь."
		myNextLine[i]	= -1
		mySpeaker[i]	= id;
		myScripts[i]	= [slimetrouble_to_give_slime,1]
		//Line 17
		i++
		myText[i]		= "Отлично, забирай монетку."
		myNextLine[i]	= -1
		mySpeaker[i]	= id;
		myScripts[i]	= [slimetrouble_to_give_slime,0]
		//Line 18
		i++
		myText[i]		= "Звёздочка"
		myNextLine[i]	= 15
		mySpeaker[i]	= id;
		//Line 19
		i++
		myText[i]		= "Спасибо"
		myNextLine[i]	= -1
		mySpeaker[i]	= id;
		myScripts[i]	= [slimetrouble_to_give_slime,2]
	#endregion
	break
	
	case "nikita_thanks_for_help":
	#region Nikita wait realization of third stage of quest
		var i = 0;
		//Line 0
		myText[i]		= "Спасибо за то что отдал мне слизь";
		myEmotion[i]	= 1;
		mySpeaker[i]	= id;
	#endregion
	break
	
	case "player_was_greedy":
	#region If nikite obizhen
		var i = 0;
		//Line 0
		myText[i]		= "ОТДАЙ МНЕ СЛИЗЬ";
		mySpeaker[i]	= id;
		//Line 2
		i++
		myText[i]		= ["Отдать","Оставить себе"]
		myNextLine[i]	= [3,4]
		myTypes[i]		= 1
		mySpeaker[i]	= obj_player;
		myScripts[i]	= [[slimetrouble_to_give_slime,2],[slimetrouble_nikita_take_displasure]]
		//Line 3
		i++
		myText[i]		= "НУ НАКОНЕЦ-ТО ТЫ СДЕЛАЛ ЭТО, ТЫ ОТДАЛ МНЕ СРАНУЮ СЛИЗЬ, Я ВООБЩЕ НЕ ПОНИМАЮ ПОЧЕМУ ТЫ ЕЁ ЗАЖОПИЛ.";
		myNextLine[i]	= -1
		mySpeaker[i]	= id;
		//Line 4
		i++
		myText[i]		= "Пошёл в жопу";
		myNextLine[i]	= -1
		mySpeaker[i]	= id;
	#endregion
	break;
}