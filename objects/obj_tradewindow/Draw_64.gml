event_inherited()

draw_text(window_x+7,window_y+20,trade_with_word+trade_creator)

var yy=0; for(var i = drawelementstart;i<drawelementstart+drawelementheight;i++){
	if i >= trade_list_size{break}
	draw_offer_button(i,yy)

	yy++
}

draw_change_page_button(window_x+100,window_y+216,-1)
draw_set_halign(fa_center)
draw_text(window_x+150,window_y+214,string(trade_page+1)+"/"+string(trade_max_page+1))
draw_change_page_button(window_x+176,window_y+216,1)
draw_text(window_x+150,window_y+260,string(drawelementstart))