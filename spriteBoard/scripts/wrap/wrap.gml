/// @function wrap(val,min,max);
/// @description If outside range, this script loops the value back around.
/// @param {real} val Value to be wrapped.
/// @param {real} min Minimum range.
/// @param {real} max Maximum range.
function wrap(argument0, argument1, argument2) {
	//By Thaniel.

	//Prevent looping if values are problematic.
	if argument1 >= argument2 {
		return(argument0);
		exit;
		}

	//Define values.
	var value = argument0;
	var range = argument2-argument1;

	//If value is outside range...
	while (value<argument1||value>=argument2) {
		//If below limit, add range.
		if value < argument1 value += range;
		//If above limit, subtract range.
		if value >= argument2 value -= range;
		}

	//Return in-range value.
	return(value);


}
