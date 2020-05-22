/*if there is another window above the window, then disable moving the header.
True - Mouse position free
False - Mouse position taken
*/
var list  = obj_controller.window_list,
    count = ds_list_size(list);

if (count == 0) return;

var freeID, freeDepth;
freeID           = list[|0];
freeID.placefree = true;
freeDepth        = freeID.depth;

for (var i = 1; i < count; i++)
{
    var tryID = list[|i];
    if (tryID.mouseover == true && tryID.depth <  freeDepth)
    {
        freeID.placefree = false;
        
        freeID           = tryID;
        freeID.placefree = true;
        freeDepth        = freeID.depth;
    }
}


// --- DEBUG ---
for (var i = 0; i < count; i++)
{
    show_debug_message(
        "ObjID: " + string(list[|i]) +
        " Depth: " + string(list[|i].depth) +
        " Place free: " + string(list[|i].placefree))
}

					
						