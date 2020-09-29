/// @function insert_banner(directory);
/// @description Stores banner into an array.
/// @param {real} directory The file path where the image is located at.
function insert_banner(argument0) {

	//Get filename.
	var ff = filename_name(argument0);

	//If file is animated...
	if string_pos("~",ff) != 0 {
		//... delete file extension...
		ff = string_delete(ff,string_pos(".png",ff),4);
		//... delete file prefix...
		ff = string_delete(ff,1,string_pos("~",ff));
		//... get speed position...
		var ss = string_pos("s",ff);
		//... and calculate sprite properties.
		bannerIndex[bannerCount,1] = max(real(string_digits(string_delete(ff,ss,string_length(ff)-(ss-1)))),1); //Frame//
		bannerIndex[bannerCount,2] = max(real(string_digits(string_delete(ff,1,ss-1))),1); //Speed//
		}
	//If not, set default values.
	else {
		bannerIndex[bannerCount,1] = 1;
		bannerIndex[bannerCount,2] = 0;
		}
	//Init animation.
	bannerFrame[bannerCount] = 0;

	//Store banner in variable.
	bannerIndex[bannerCount,0] = sprite_add(argument0,bannerIndex[bannerCount,1],0,0,0,0);
	//Increase display size.
	bannerWidth += sprite_get_width(bannerIndex[bannerCount,0]);
	//Next banner.
	bannerCount++;


}
