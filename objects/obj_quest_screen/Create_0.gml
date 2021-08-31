quest_screen_x = 0
quest_screen_y = obj_gui_screen_controller.screen_start_y+5
selected_quest = obj_questmanager.tracking_quest

mb_wheel_spd = 16
#region Quest List
quest_list = obj_questmanager.ds_current_quests
quest_list_start_x = quest_screen_x
quest_list_start_y = quest_screen_y - 5
quest_list_button_width = (GUIWIDTH/4)
quest_list_button_height = 30
quest_list_button_offset_y = 5
quest_list_button_name_x = 5
quest_list_button_name_y = 0
quest_list_button_decription_x = 5
quest_list_button_decription_y = 20

//If mouse over the zone, then check mouse wheel scrolling
quest_list_mouse_zone_x1 = quest_list_start_x 
quest_list_mouse_zone_y1 = quest_list_start_y
quest_list_mouse_zone_x2 = quest_list_mouse_zone_x1 + quest_list_button_width + 3
quest_list_mouse_zone_y2 = quest_list_mouse_zone_y1 + GUIHEIGHT - quest_list_start_y
quest_list_scroll_y = 0

quest_list_ds_height = ds_list_size(quest_list)

quest_list_spr = spr_quest_list_button

function restore_surf_quest_list(){
	quest_list_surf = surface_create(quest_list_mouse_zone_x2,quest_list_mouse_zone_y2)
}
restore_surf_quest_list()
#endregion
line_1x = quest_list_button_width + 2
#region Quest Tasks
tasks_start_x = line_1x + 2
tasks_start_y = quest_screen_y
tasks_button_width = (GUIWIDTH/2)
tasks_button_height = 30
tasks_button_offset_y = 5
tasks_button_name_x = 2
tasks_button_name_y = 0
tasks_button_description_x = 2
tasks_button_description_y = 25

tasks_spr = spr_quest_tasks_button
#endregion

quest_give_all_quest()