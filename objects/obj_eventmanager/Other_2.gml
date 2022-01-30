//EventMap contain registered events
global.eventMap = ds_map_create()
#macro EVENT_NONE "none"
#macro EVENT_GUI_RESIZE "gui_resize"
#macro EVENT_ENEMY_KILLED "enemy_killed"//Return entity_name (object_index) of enemy
#macro EVENT_ITEM_PICKUPED "item_pickuped"//Return item and quantity
#macro EVENT_ITEM_DROPPED "item_dropped"
#macro EVENT_TRIGGER "trigger"
#macro EVENT_NPC_TALK "talk" //Return npc_obj (object_index)
#macro EVENT_NPC_DELIVER "deliver"
#macro EVENT_INVENTORY_CLICKED "inventory_clicked"//Return _inv (inventory_id), _slot (slot_id) and item_before_click (item_id)