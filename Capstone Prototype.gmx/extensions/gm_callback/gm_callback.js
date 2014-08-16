//* Description *//
// Title: GM Callback
// Author: Tyler Reed and Jackson Yarr
// Used to allow Game Maker and Java Script to Communicate

// Create the Callback Object
var gm_callback = new Object();

// Calls the specified Script
function callback_script(extension_name, argument_count)
{
	// Make sure the Extension does not already Exist
	if(gm_callback[extension_name] != undefined)
		return true;

	// Determine the Function to Call
	var object_function = window["callback_script"].caller.name;

	// Make sure it works with IE
	if(object_function == undefined)
		object_function = arguments.callee.caller.toString().match(/function ([^\(]+)/)[1];
	
	var args = "";
	var gmres = "0, 0";

	// Determine whether or not the Arguments need to be Parsed
	if(argument_count > 0)
	{
		// Parse the Arguments
		while(argument_count > 0)
		{
			args = "arg" + argument_count + ", " + args;
			argument_count--;
		}

		// Remove the Trailing Comma
		args = args.substring(0, args.length - 2);

		// Delimit the GM
		gmres = gmres + ", ";
	}
	
	// Define the Callback Function [Will be of the form: (function(arg0, ..., argN){<obfuscated function>(0, 0, arg0, ..., argN);})]
	gm_callback[extension_name] = eval("(function(" + args + "){" + object_function + "(" + gmres + args + ");})");
	
	return false;
}

// Returns whether or not the specified Script has been Defined
function callback_define_script(extension_name, gm_script)
{
	return gm_callback[extension_name] != undefined;
}