//Reload Save List
ds_list_destroy(ds_saves)
ds_saves = ds_list_create()
var file = file_find_first("Saves\\*",fa_directory)
while(file != ""){
	if file_exists("Saves\\"+file+"/playerdata.txt"){
		ds_list_add(ds_saves,file)	
	}

	file = file_find_next();
}
file_find_close()
	
ds_size = ds_list_size(ds_saves)