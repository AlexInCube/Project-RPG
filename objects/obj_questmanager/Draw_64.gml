
var ds_height = ds_grid_height(ds_quests)

var i=0;repeat(ds_height){
	var shortdarr=ds_quests[# 3,i]
	if ds_quests[# 0,i]!=-1{
		draw_text(5,5+(16*i),string(ds_quests[# 1,i])+":"
		+string(ds_quests[# 0,i])+"/"
		+string(array_length_1d(ds_quests[# 5,i]))+" "
		+string(shortdarr[ds_quests[# 0,i]]))
	}
	i++
}