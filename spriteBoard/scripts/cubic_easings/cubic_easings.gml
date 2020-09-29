/// @function ease_inout_cubic(time,start,change,duration)
/// @param {real} time		Current position in the easing.
/// @param {real} start		The easing's starting position.
/// @param {real} change	The easing's end position relative to start.
/// @param {real} duration	The duration the easing will have.
/// @description Stores banner into an array.

function ease_inout_cubic(argument0,argument1,argument2,argument3) {
	
	//Return easing.
	argument0 /= argument3 * 0.5;
	
	if (argument0 < 1) {
		return (argument2 * 0.5) * power(argument0, 3) + argument1;
		}
    
	return (argument2 * 0.5) * (power(argument0 - 2, 3) + 2) + argument1;
	
	}

/// @function ease_out_cubic(time,start,change,duration)
/// @param {real} time		Current position in the easing.
/// @param {real} start		The easing's starting position.
/// @param {real} change	The easing's end position relative to start.
/// @param {real} duration	The duration the easing will have.
/// @description Stores banner into an array.

function ease_out_cubic(argument0,argument1,argument2,argument3) {

	//Return easing.
	return argument2 * (power(argument0 / argument3 - 1, 3) + 1) + argument1;
	
	}