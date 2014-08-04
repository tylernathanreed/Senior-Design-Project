//* Description *//
// Usage: JS_variable_set(inst, name, value);
// Function: Sets the Value of the specified Variable from the specified Instance
// Arguments:
// 1) inst : id - The ID of the specified Instance
// 2) name : string - The Name of the Variable
// 3) value : any - The New Value of the specified Variable

//* Arguments *//
var inst, name, value;

inst = argument0;
name = string(argument1);
value = argument2;

//* Callback *//
// Make sure the Script is Defined in the Callback
if(!callback_script("JS_variable_set", argument_count))
    exit;

//* Validation *//
// Make sure the Instance Exists
if(!instance_exists(inst))
    return false;

// Make sure the Instance has the API Trigger
if(!object_is_ancestor(inst.object_index, par_all))
    return false;

//* Main Body *//
// Create the API Map
var api = ds_map_create();

// Add the API Attributes
ds_map_add(api, "type", "set");
ds_map_add(api, "name", name);
ds_map_add(api, "value", value);

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
