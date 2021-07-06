//Calculate map zoom
if mouse_wheel_down() map_zoom -= map_zoom_step
if mouse_wheel_up()	  map_zoom += map_zoom_step

map_zoom = clamp(map_zoom,map_zoom_min,map_zoom_max)

//Dragging the map
if !drag {
   if mouse_check_button_pressed(mb_left) {
      drag = true
      mx = map_x - device_mouse_x_to_gui(0)
      my = map_y - device_mouse_y_to_gui(0)
   }
}else{
   map_x = device_mouse_x_to_gui(0) + mx
   map_y = device_mouse_y_to_gui(0) + my
   if !mouse_check_button(mb_left) {
      drag = false
   }
}
//Not allow map go cross the border
/*
map_x = clamp(map_x, map_width*-1, map_surf_width - (map_width*map_zoom))
map_y = clamp(map_y, map_height*-1, map_surf_height - (map_height*map_zoom))