box = spr_dialogue
frame = spr_portraitbg
portrait = spr_portrait
namebox = spr_namebox

obj_inventory.inventorylock=true

box_width = sprite_get_width(box)
box_height = sprite_get_height(box)
port_width = sprite_get_width(portrait)
port_height = sprite_get_height(portrait)
namebox_width = sprite_get_width(namebox)
namebox_height = sprite_get_height(namebox)

guiwidth=display_get_gui_width()
guiheight=display_get_gui_height()

port_x = (guiwidth - box_width - port_width) * 0.5
port_y = guiheight*0.98-port_height
box_x = port_x + port_width
box_y = port_y
namebox_x = port_x
namebox_y = box_y - namebox_height

font=fnt_small
draw_set_font(font)

x_buffer = 12
y_buffer = 8
text_x = box_x + x_buffer
text_y = box_y + y_buffer
name_text_x = namebox_x + (namebox_width/2)
name_text_y = namebox_y + (namebox_height/2)
text_max_width = box_width - (2*x_buffer)
text_height = string_height("M")




counter=0

page=0
text[0] = ""
name = ""
voice = snd_voice

drawtxtcol=c_black

