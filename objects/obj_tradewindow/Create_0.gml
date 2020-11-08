///@description Trade Window
event_inherited();
window_name=find_keyword("trade_window")
window_sprite=spr_tradewindow
window_width=sprite_get_width(window_sprite)
window_height=sprite_get_height(window_sprite)
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
trade_list = create_trade_list(
	[//t_a[0]
		[//is_a[0]
			[item.coin,1],
			[item.apple,2],
			[item.blueleaf,3],
			[item.blueleaf,3]
		],
		[//is_a[1]
			[item.apple,1],
			[item.coin,1],
			[item.apple,2],
			[item.blueleaf,3]
		]
	],
	[//t_a[1]
		[
			[item.coin,3]
		],
		[
			[item.iron_ingot,1]
		]
	]
)


trade_list_size = ds_list_size(trade_list)
/* 
Setup slots number and size 
*/
offer_button_sprite=spr_offer_button
cell_x_size=sprite_get_width(offer_button_sprite)//Slot size
cell_y_size=sprite_get_height(offer_button_sprite)//Slot size
offer_x=7
offer_y=27
x_buffer=1
y_buffer=2
//Starting XY
slots1_x=5
slots_y=5
slots2_x=157




function draw_trade_slot(xx,yy,_item,_item_count){
	draw_sprite(spr_slot,0,xx,yy)
	draw_sprite(global.item_index[# _item, item_stat.sprite_index],1,xx+16,yy+16)
	draw_text(xx+2,yy+12,_item_count)
}