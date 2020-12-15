///@description Trade Window
event_inherited();
window_name=find_keyword("trade_window")
trade_creator=""
trade_creator=find_keyword(trade_creator)
trade_with_word=find_keyword("trade_with_name")
window_width=300
window_height=248
persistent=false
/*
[//Trade list
	[//First Trade
		[//Items to spend
			[item.coin,64]
		],
		[//Items to be received
			[item.iron_chestplate,1]
		]
	],
]
*/
trade_array = [//Trade list
	[//First Trade
		[//Items to spend
		],
		[//Items to be received
		]
	],
]
event_user(0)

drawelementstart = 0
drawelementheight = 4
/* 
Setup slots number and size 
*/
offer_button_sprite=spr_offer_button
cell_x_size=sprite_get_width(offer_button_sprite)//Slot size
cell_y_size=sprite_get_height(offer_button_sprite)//Slot size
offer_x=7
offer_y=40
x_buffer=1
y_buffer=2
//Starting XY
slots1_x=5
slots_y=5
slots2_x=157




function draw_trade_slot(xx,yy,_item,_item_count){
	draw_sprite(spr_slot,0,xx,yy)
	var _item_struct = return_struct_from_item_index_by_item_id(_item)
	draw_sprite(_item_struct[$ "item_sprite"],1,xx+16,yy+16)
	draw_text(xx+2,yy+12,_item_count)
}

function draw_change_page_button(xx,yy,l_or_r){
	var mo = 0
	if mouseover(xx,yy,xx+24,yy+24){
		mo = 1
		if mouse_check_button_pressed(mb_left){
			trade_page +=l_or_r
			trade_page = clamp(trade_page,0,trade_max_page)
			drawelementstart+=l_or_r*drawelementheight
		}
	}
	if l_or_r == -1{
		draw_sprite_ext(spr_trade_change_page_button,mo,xx+24,yy,l_or_r,1,0,c_white,1)
	}else{
		draw_sprite_ext(spr_trade_change_page_button,mo,xx,yy,l_or_r,1,0,c_white,1)
	}
}

function draw_offer_button(ii,yy){
	var offer_yy = window_y+(offer_y+((y_buffer+cell_y_size)*yy))
	//Get trade array
	var t_a = trade_list[| ii]
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
	//Check items to spend in player inventory
	var items_check = true//If player does not have at least one item in trade, items check was fail.
	for(var i=0;i<array_length(is_a);i++){
		var item_array = array_get(is_a,i)
		if !check_requirement_item(global.inventory,item_array[0],item_array[1]){
			items_check = false
			break
		}
	}
	//Draw offer button
	var mo = false
	if placefree{
		if mouseover(window_x+offer_x,offer_yy,window_x+offer_x+cell_x_size,offer_yy+cell_y_size){
			if items_check = true{
				mo = true
				if mouse_check_button_pressed(mb_left){
					//item recieve
					for(var i=0;i<array_length(ir_a);i++){
						var item_array = array_get(ir_a,i)
						item_gain(item_array[0],item_array[1],global.inventory)
					}
					//item spend
					for(var i=0;i<array_length(is_a);i++){
						var item_array = array_get(is_a,i)
						grab_item(item_array[0],item_array[1],global.inventory)
					}
				}
			}
		}
	}
	draw_sprite(spr_offer_button,mo,window_x+offer_x,offer_yy)
}