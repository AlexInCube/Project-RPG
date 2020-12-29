window_x = 0
window_y = 0
window_width = 300
window_height = 200
window_sprite=spr_question_window
question = "question"
answer_yes = "yes"
yes_script = nothing
answer_no = "no"
no_script = nothing
str_width_yes = string_width(answer_yes)
str_height_no = string_width(answer_no)

function draw_button_yes(xx,yy){
	draw_nine_slice_box(spr_question_button,xx,yy,xx+39+str_width_yes,yy+39,0)
	draw_sprite(spr_question_button_mark,1,xx+6+str_width_yes,yy+6)
	draw_text(xx+6,yy+16,answer_yes)
}

function draw_button_no(xx,yy){
	draw_nine_slice_box(spr_question_button,xx,yy,xx+39+str_height_no,yy+39,0)
	draw_sprite(spr_question_button_mark,0,xx+6+str_height_no,yy+6)
	draw_text(xx+6,yy+16,answer_no)

}