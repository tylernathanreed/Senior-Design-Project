//* Description *//
// Usage: JS_variable_set_group(inst, group, value);
// Function: Sets the Values of the specified Group from the specified Instance
// Arguments:
// 1) inst : id - The ID of the specified Instance
// 2) group : string - The Name of the Variable
// 3) value : JSON Map - The New Values for each Variable in the specified Group

//* Arguments *//
var inst, group, value;

inst = argument0;
group = string(argument1);
value = json_decode(argument2);

//* Callback *//
// Make sure the Script is Defined in the Callback
if(!callback_script("JS_variable_set_group", argument_count))
    exit;

//* Validation *//
// Make sure the Instance Exists
if(!instance_exists(inst))
    return false;

// Make sure the Instance has the API Trigger
if(!object_is_ancestor(inst.object_index, par_all))
    return false;

// Make sure the Value is a Map
if(!ds_exists(value, ds_type_map))
    return false;

//* Main Body *//
// Create the API Map
var api = ds_map_create();

// Add the API Attributes
ds_map_add(api, "type", "set-group");
ds_map_add(api, "name", group);
ds_map_add_map(api, "value", value);

// Set the API Map to the Instance
inst.js_api = api;

// Call the API Trigger
with(inst)
    event_user(event_js_api);

// Clear the API Map
inst.js_api = noone;

// Destroy the Map
ds_map_destroy(api);

return true;
