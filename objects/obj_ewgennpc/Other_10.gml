reset_dialogue_defaults();

switch(choice_variable){
	case -1:
	
	break;
	
	case "saved_from_slimes":
		var i = 0;
		//Line 0
		myText[i]		= "Уже не могу стоять на ногах...";
		mySpeaker[i]	= id;
		myTextSpeed[i]	= [1,0.2]
		//Line 1
		i++;
		myText[i]		= "Я бегал от них слишком долго, мне нужна вода.";
		mySpeaker[i]	= id;
		myTextSpeed[i]	= [1,0.2]
		//Line 2
		i++;
		myText[i]		= "Можешь принести мне воды?";
		mySpeaker[i]	= id;
		//Line 3
		i++;
		myText[i]		= ["Да","Нет"];
		myTypes[i]		= 1;
		mySpeaker[i]	= obj_player;
		myNextLine[i]	= [4,5];
		//Line 4
		i++;
		myText[i]		= "Жду тебя.";
		mySpeaker[i]	= id;
		myNextLine[i]	= -1
		myScripts[i]	= [method_get_index(wait_water)]
		//Line 5
		i++;
		myText[i]		= "Почемуууууу нееет?";
		mySpeaker[i]	= id;
		myNextLine[i]	= -1
		myTextSpeed[i]	= [1,0.2]
	break
	
	case "wait_water":
		var i = 0
		//Line 0
		myText[i]		= "Неужели ты уже раздобыл где-то воду?";
		mySpeaker[i]	= id;
		myTextSpeed[i]	= [1,0.2]
		//Line 1
		i++;
		myText[i]		= ["Нет"];
		myTypes[i]		= 1;
		mySpeaker[i]	= obj_player;
		myNextLine[i]	= [2];
		myScripts[i]	= [[nothing]]
		if check_requirement_item(global.inventory,"wooden_water_bucket",1){
			array_push(myText[i],"Да")
			array_push(myNextLine[i],3)
			array_push(myScripts[i],[method_get_index(drink_water)])
		}
		//Line 2
		i++
		myText[i]		= "ЧТО ТЫ ЗДЕСЬ забыл ТОГДААААААААааааааа.....";
		mySpeaker[i]	= id;
		myNextLine[i]	= -1
		myTextSpeed[i]	= [1,0.2]
		//Line 3
		i++
		myText[i]		= "Спасибо";
		mySpeaker[i]	= id;
		myNextLine[i]	= -1
	break;
}