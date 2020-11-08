event_inherited()

for(var i=0;i<trade_list_size;i++){
	var offer_yy = window_y+(offer_y+((y_buffer+cell_y_size)*i))
	//Get trade array
	var t_a = trade_list[| i]
	var is_a = t_a[0]
	//Draw item to spend
	for(var j=0;j<array_length(is_a);j++){
		draw_trade_slot(window_x+(offer_x+slots1_x+(33*j)),offer_yy+slots_y,array_get(is_a[j],0),array_get(is_a[j],1))
	}
	//Draw item to receieve
	var ir_a = t_a[1]
	for(var j=0;j<array_length(ir_a);j++){
		draw_trade_slot(window_x+(slots2_x+(33*j)),offer_yy+slots_y,array_get(ir_a[j],0),array_get(ir_a[j],1))
	}
	//Draw offer button
	var mo = false
	if placefree{
		if mouseover(window_x+offer_x,offer_yy,window_x+offer_x+cell_x_size,offer_yy+cell_y_size){
			mo = true
		}
	}
	draw_sprite(spr_offer_button,mo,window_x+offer_x,offer_yy)
}