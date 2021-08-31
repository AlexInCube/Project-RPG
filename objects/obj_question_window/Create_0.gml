window_x = 0
window_y = 0
window_width = 300
window_height = 200
window_sprite=spr_question_window
question = "question"
answer_yes = "yes"
yes_script = nothing
yes_arg = undefined
answer_no = "no"
no_script = nothing
no_arg = undefined
str_width_yes = string_width(answer_yes)
str_height_no = string_width(answer_no)

function draw_button_yes(xx,yy){
	draw_sprite_stretched(spr_question_button,0,xx,yy,39+str_width_yes,39)
	draw_sprite(spr_question_button_mark,1,xx+6+str_width_yes,yy+6)
	draw_text(xx+6,yy+16,answer_yes)
}

function draw_button_no(xx,yy){
	draw_sprite_stretched(spr_question_button,0,xx,yy,39+str_width_yes,39)
	draw_sprite(spr_question_button_mark,0,xx+6+str_height_no,yy+6)
	draw_text(xx+6,yy+16,answer_no)

}