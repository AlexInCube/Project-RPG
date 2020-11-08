activewindow=false
window_sprite=spr_basicwindow
window_name=find_keyword("Basic Window")
window_width=sprite_get_width(window_sprite)
window_height=sprite_get_height(window_sprite)
window_x=0
window_y=0
window_dragging=false

mouse_over=false
placefree = true
ds_list_add(WINDOW_LIST,id)
//For window dragging
xx=0
yy=0
mousexoffset=0
mouseyoffset=0
windowsetdepth()