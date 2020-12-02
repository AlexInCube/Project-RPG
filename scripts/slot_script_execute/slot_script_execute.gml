//Hotbar item using
function slot_script_execute(inventory, slot_id) {
	var _item = inventory[# slot_id,0]
	var _item_script = global.item_index[# _item,item_stat.action_script]
	if _item_script>0//If item have script
	{
		var src = global.item_index[# _item,item_stat.arg_array]
		var _item_args = []; array_copy(_item_args,0,src,0,array_length(src))
		array_push(_item_args,[inventory,slot_id])//Push inv and slot_id to item script
		script_execute_ext(_item_script,_item_args)
	}
}
