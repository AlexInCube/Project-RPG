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

	    if (tryID.mouseover == true && tryID.depth <  freeDepth)
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


					
						