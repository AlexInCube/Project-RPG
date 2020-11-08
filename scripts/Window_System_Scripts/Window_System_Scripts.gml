///@description create_window
///@arg window_xx
///@arg window_yy
///@arg window_object_id
function create_window(window_xx, window_yy, window_object_id) {
	var window = instance_create_depth(window_xx,window_yy,0,window_object_id)
	window.window_x = window_xx
	window.window_y = window_yy
	window.xx = window_xx
	window.yy = window_yy
	with(obj_basicwindow){
		activewindow=false
	}
	window.activewindow=true
	windowsetdepth()

	return window
}

function getwindowcross() {
	/*if there is another window above the window, then disable moving the header.
	True - Mouse position free
	False - Mouse position taken
	*/
	if instance_exists(obj_basicwindow){
		var list  = WINDOW_LIST,
		    count = ds_list_size(list);

		if (count == 0) return;

		var freeID, freeDepth;
		freeID    = noone;
		freeDepth = 100000000;

		for (var i = 0; i < count; i++)
		{
		    var tryID = list[|i];
		    tryID.placefree = false;

		    if (tryID.mouse_over == true && tryID.depth <  freeDepth)
		    {
		        freeID           = tryID;
		        freeDepth        = freeID.depth;
		    }
		}

		if (freeID != noone)
		{
		    freeID.placefree = true;
		}
	}
}

function windowsetdepth() {
	//Set window depth for all window if new window created or user clicked on window title
	var newDepth = -1

	with obj_basicwindow {
		depth = depth + 1
		if activewindow depth = newDepth
	}

}
