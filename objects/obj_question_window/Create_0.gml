// Inherit the parent event
event_inherited();
window_sprite=spr_question_window
question = "question"
answer_yes = "yes"
answer_no = "no"
question = find_keyword(question)
answer_yes = find_keyword(answer_yes)
answer_no = find_keyword(answer_no)
question_button_sprite = spr_question_button

function draw_button(xx,yy,type){
	//Draw left part
	draw_sprite_part(question_button_sprite,type,0,0,8,32,xx,yy)
	//Draw middle part
	draw_sprite_part(question_button_sprite,type,,0,8,32,xx,yy)
}