txt = ""
keyboard_string = ""
draw_end = false
box_width = 200
box_height = 32
box_sprite = spr_ui_textbox
xx = 0
yy = 0
char_limit = 20

function draw_gui(){
	draw_sprite_stretched(box_sprite,0,xx,yy,box_width,box_height)
	draw_set_halign(fa_left);
	draw_set_valign(fa_top)
	draw_set_color(c_black)
	draw_text(xx+3, yy, txt);
}