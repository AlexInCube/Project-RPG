///@description Convert inventory into correct string
function stringify_grid_with_structs(inv,row_structs){
	var inv_grid = ds_grid_create(ds_grid_width(inv),ds_grid_height(inv))//Create temp grid
	ds_grid_copy(inv_grid,inv)//Copy content of the grid to temp grid
	for(var i=0;i<ds_grid_width(inv);i++){//Copy structs to temp grid
		inv_grid[# i, row_structs] = json_stringify(inv[# i, row_structs])
	}
	var grid_string = ds_grid_write(inv_grid)//Convert temp grid into string
	ds_grid_destroy(inv_grid)//Destroy temp grid
	return grid_string//Return stringifyed grid
}
///@description Parse inventory from string which create by stringify_inventory
function parse_grid_with_structs(read_to_inv,inv_string,row_structs){
	ds_grid_read(read_to_inv,inv_string)//Copy content of saved inventory
	for(var i=0;i<ds_grid_width(read_to_inv);i++){//Convert stringifyed structs to normal structs
		read_to_inv[# i, row_structs] = json_parse(read_to_inv[# i, row_structs])
	}
}

function stringify_inventory(inv){
	return stringify_grid_with_structs(inv,2)
}

function parse_inventory(inv,inv_string){
	return parse_grid_with_structs(inv,inv_string,2)
}

function stringify_effects(buff_grid){
	return stringify_grid_with_structs(buff_grid,1)
}

function parse_effects(lifeform,effects_string){
	with lifeform{
		if ds_exists(buff_grid,ds_type_grid){
			ds_grid_resize(buff_grid,effects_string[1]+1,2)
		}else{
			buff_grid = ds_grid_create(effects_string[1],2)
		}
		parse_grid_with_structs(buff_grid,effects_string[0],1)
	}
	var i = 0; repeat(ds_grid_width(lifeform.buff_grid)){
		effect_script_execute(lifeform.buff_grid[# i,0],EFFECT_SCRIPT_CREATE,[lifeform])
		i++
	}
}

///@description Saving working if game paused
function save_game() {
	var save_data = {
		player_x: obj_player.phy_position_x,
		player_y: obj_player.phy_position_y,
		player_current_room:  room_get_name(room),
		player_hp: obj_player_stats.hp,
		player_lvl: obj_player_stats.level,
		player_exp: obj_player_stats.expr,
		player_attribute_points: obj_player_stats.attribute_points,
		player_attributes: {
			strength : obj_player_stats.strength,
			energy : obj_player_stats.energy,
			defense: obj_player_stats.defense,
			agility: obj_player_stats.agility
		},
		player_inventory: stringify_inventory(global.inventory),
		player_equipment: stringify_inventory(global.equipment),
		player_effects: [stringify_effects(obj_player_stats.buff_grid),ds_grid_width(obj_player_stats.buff_grid)-1],
		player_quests: ds_list_write(obj_questmanager.ds_current_quests),
		player_tracked_quest: obj_questmanager.tracking_quest,
		world_time: {
			hours: obj_controller.hours,
			minutes: obj_controller.minutes,
			seconds: obj_controller.seconds
		},
		story_tags: ds_list_write(obj_controller.cur_story_tags),
		saving_time: {
			day: current_day,
			month: current_month,
			year: current_year,
			second: current_second,
			minute: current_minute,
			hour: current_hour
		},
		game_version: GM_version,
	}
	var save_string = json_stringify(save_data)

	//Save Main Data
	var file_path = "Saves\\"+global.directory_save+"\\"+"playerdata.txt"
	var file = file_text_open_write(file_path)
	file_text_write_string(file,save_string)
	file_text_close(file)
	show_debug_message(LOGGER_SAVE_MANAGER+"Main data saved: "+file_path)
	
	
	instance_activate_all()

	//End of write playerdata.txt
	save_room_data(room,return_room_data())
	//End of write room_name.txt
	show_debug_message(LOGGER_SAVE_MANAGER+"Room saved: "+file_path)
	show_debug_message(LOGGER_SAVE_MANAGER+"Game saved!")
}
//Game loading working from anywhere
function load_game() {
	instance_activate_all()//This need if we run game loading from pause
	//Find main save file
	var file_path = "Saves\\"+global.directory_save+"\\"+"playerdata.txt"
	var file = file_text_open_read(file_path)
	var save_string = file_text_read_string(file)
	file_text_close(file)
	var save_data = json_parse(save_string)
	//Applying player stats
	with (obj_player_stats){
		expr = save_data.player_exp
		level = save_data.player_lvl
		max_expr = max_exp_calc(level)
		attribute_points = save_data.player_attribute_points
		strength = save_data.player_attributes.strength
		energy = save_data.player_attributes.energy
		defense = save_data.player_attributes.defense
		agility = save_data.player_attributes.agility

		hp = save_data.player_hp
		//hp = clamp(hp,0,max_hp)
	}
	obj_controller.hours = save_data.world_time.hours
	obj_controller.minutes = save_data.world_time.minutes
	obj_controller.seconds = save_data.world_time.seconds

	//Load buff list
	parse_effects(obj_player_stats, save_data.player_effects)
	//Load quest list and cycle through all list to create quest listeners
	with(obj_questmanager){
		ds_list_clear(ds_current_quests)
		ds_list_read(ds_current_quests,save_data.player_quests)
		//Create quest listeners
		var i=0;repeat(ds_list_size(ds_current_quests))
		{
			var quest_id = ds_current_quests[| i][@ quest_data.name]
			with instance_create_depth(0,0,0,obj_questlistener)
			{
				self.quest_id = quest_id
				alarm[0]=1
			}
			i++
		}
		quest_tracking_update(try_load_data(save_data,"player_tracked_quest",undefined))
	}
	//Read unique objects data
	load_room_data()
	//End of read room_name.txt
	//Applying player coordinates
	if !instance_exists(obj_player){
		instance_create_layer(save_data.player_x,save_data.player_y,"Instances",obj_player)
	}else{
		with(obj_player){
			phy_position_x = save_data.player_x
			phy_position_y = save_data.player_y
		}
	}
	//Player Inventory
	with(obj_inventory) parse_inventory(global.inventory,save_data.player_inventory)
	//Player Equipment
	with(obj_inventory){
		parse_inventory(global.equipment,save_data.player_equipment)
		recalculate_stats(global.equipment)
	}
	
	show_debug_message(LOGGER_SAVE_MANAGER+"Playerdata.txt loaded")
}

function try_load_data(struct,var_name,_default){
	if variable_struct_exists(struct,var_name){
		return variable_struct_get(struct,var_name)
	}
	return _default
}

function return_room_data(){
	//Save data about unique objects (trophy, doors and etc...)
	var object_list = ds_list_create()
	
	var tagged = tag_get_asset_ids("saveable", asset_object);
	for (var i = 0; i < array_length(tagged); i++) {
		with (tagged[i]) {
			var _map = ds_map_create()
			ds_list_add(object_list,_map)
			ds_list_mark_as_map(object_list,ds_list_size(object_list)-1)
				
			//User 14 using only for saving, User 15 only for loading
			CallUserEvent(14,_map)
		}
	}
	
	
	
	var wrapper = ds_map_create()
	ds_map_add_list(wrapper,"object_list",object_list)
	show_debug_message(LOGGER_SAVE_MANAGER+"Saveable object exists: "+string(ds_list_size(object_list)))
	var save_string = json_encode(wrapper);
	ds_map_destroy(wrapper);
	return save_string
	
}

function save_room_data(room_name,room_data){
	var file_path = "Saves\\"+global.directory_save+"\\"+string(room_get_name(room_name))+".txt"
	
	if file_exists(file_path){
		file_delete(file_path)
	}
	
	var file = file_text_open_write(file_path)
	file_text_write_string(file,room_data)
	file_text_close(file)
}

function load_room_data(){
	var file_path = "Saves\\"+global.directory_save+"\\"+string(room_get_name(room))+".txt"
	if file_exists(file_path){
		var file = file_text_open_read(file_path)
		var wrapper = json_decode(file_text_read_string(file))
		file_text_close(file)
		var list = wrapper[? "object_list"]
	
		for(var i=0; i<ds_list_size(list);i++){
			var map = list[| i]
			var obj = map[? "obj"]
			
			with(asset_get_index(obj))
			{
				CallUserEvent(15,map)
			}
		}
		show_debug_message(LOGGER_SAVE_MANAGER+"Room loaded: "+file_path)
		ds_map_destroy(wrapper)
	}else{
		show_debug_message(LOGGER_SAVE_MANAGER+"Error while room loading: "+file_path)
	}
}

#region /* Save/Load Window */

///@description Create save selecting window
///@function open_save_window([show_save_button?])
///@param [show_save_button?]
function open_save_window(){
	var show_save_button = false
	if argument_count >= 1{
		show_save_button = argument0
	}
	obj_mainmenucontroller.menustate = menu_state.window_load_save
	if !instance_exists(obj_save_or_load_window){
		with instance_create_depth(0,0,0,obj_save_or_load_window){
			saving = show_save_button
		}
	}
}

#endregion

function write_last_played_save(){
	ini_open("misc.ini")
	ini_write_string("saves","lastsave",global.lastsave)
	ini_close()
}

function load_last_player_save(){
	if file_exists("misc.ini"){
		ini_open("misc.ini")
		global.lastsave = ini_read_string("saves","lastsave","")
		ini_close()
		global.directory_save = global.lastsave
		start_load()
	}else{
		show_message("Misc.ini not exists")
	}
}

///@function file_copy_dir(source, target, attributes)
function file_copy_dir(){
// Copies contents from source directory to target directory.
// Add fa_directory to attributes for recursive copying.
var fname, i, file, files, from, to;
// create directory if it doesn't exist yet:
if (!directory_exists(argument1)) directory_create(argument1)
// push matching files into array:
// (has to be done separately due to possible recursion)
files = 0
for (fname = file_find_first(argument0 + "/*.*", argument2); fname != ""; fname = file_find_next()) {
    // don't include current/parent directory "matches":
    if (fname == ".") continue
    if (fname == "..") continue
    // push file into array
    file[files] = fname
    files += 1
}
file_find_close()
// process found files:
i = 0
repeat (files) {
    fname = file[i]
    i += 1
    from = argument0 + "/" + fname
    to = argument1 + "/" + fname
    if directory_exists(from) { // note: in GM:S+, prefer directory_exists(from)
        file_copy_dir(from, to, argument2) // recursively copy directories
    } else {
        file_copy(from, to) // copy files as normal
    }
}
}