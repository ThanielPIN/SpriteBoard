/// @function hex(string);
/// @description Converts a string into a hex value.
/// @param {int} val String.
function hex(argument0) {
	//By YellowAfterlife.

	var result=0;

	// special unicode values
	var ZERO=ord("0");
	var NINE=ord("9");
	var A=ord("A");
	var F=ord("F");

	for (var i=1; i<=string_length(argument0); i++){
	    var c=ord(string_char_at(string_upper(argument0), i));
	    // you could also multiply by 16 but you get more nerd points for bitshifts
	    result=result<<4;
	    // if the character is a number or letter, add the value
	    // it represents to the total
	    if (c>=ZERO&&c<=NINE){
	        result=result+(c-ZERO);
	    } else if (c>=A&&c<=F){
	        result=result+(c-A+10);
	    // otherwise complain
	    } else {
	        // this will make the browser behave badly but you can leave it in
	        // actual game maker if you want
	        //show_error("bad input for hex(str)", true);
	    }
	}

	return result;


}
