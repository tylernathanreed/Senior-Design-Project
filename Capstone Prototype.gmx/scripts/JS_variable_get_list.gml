//* Description *//
// Usage: JS_variable_get_list(inst, names, defs);
// Function: Returns the Values of the specified Variables from the specified Instance
// Arguments:
// 1) inst : id - The ID of the specified Instance
// 2) names : JSON List - The Names of the Variables
// 3) defs : JSON Map - The Default Values to return if a Variable in the List is not Found

//* Arguments *//
var inst, names, def;

inst = argument0;
names = json_decode(argument1);
defs = json_decode(argument2);

//* Callback *//
// Make sure the Script is Defined in the Callback
if(!callback_script("JS_variable_get_list", argument_count))
    exit;

//* Validation *//
// Make sure the Instance Exists
if(!instance_exists(inst))
    return false;

// Make sure the Instance has the API Trigger
if(!object_is_ancestor(inst.object_index, par_all))
    return false;

// Make sure the Names is a List
if(!ds_exists(names, ds_type_list))
    return false;

// Make sure the Defaults are a Map
if(!ds_exists(defs, ds_type_map))
    return false;

//* Main Body *//
// Create the API Map
var api = ds_map_create();

// Add the API Attributes
ds_map_add(api, "type", "get-list");
ds_map_add(api, "name", names);
ds_map_add(api, "value", defs);

// Set the API Map to the Instance
inst.ds_api = api;

// Call the API Trigger
with(inst)
    event_user(inst.event_js_api);

// Clear the API Map
inst.ds_api = noone;

// Destroy the Map
ds_map_destroy(api);

return true;
