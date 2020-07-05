activewindow=false
window_sprite=spr_basicwindow
window_name=scr_find_keyword("Basic Window")
window_width=sprite_get_width(window_sprite)
window_height=sprite_get_height(window_sprite)
window_x=0
window_y=0
window_dragging=false
guiscreen=undefined
guiscreenarg=undefined
mousexoffset=0
mouseyoffset=0
mouseover=false
placefree = true
ds_list_add(WINDOW_LIST,id)
xx=0
yy=0
scr_windowsetdepth()