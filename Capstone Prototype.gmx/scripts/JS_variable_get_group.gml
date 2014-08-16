//* Description *//
// Usage: JS_variable_get_group(inst, group, def);
// Function: Returns the Values of the specified Group from the specified Instance
// Arguments:
// 1) inst : id - The ID of the specified Instance
// 2) group : string - The Name of the Variable Group
// 3) def : any - The Default Value to return if the Group is not Found

//* Arguments *//
var inst, group, def;

inst = argument0;
group = string(argument1);
def = argument2;

//* Callback *//
// Make sure the Script is Defined in the Callback
if(!callback_script("JS_variable_get_group", argument_count))
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
ds_map_add(api, "type", "get-group");
ds_map_add(api, "name", group);
ds_map_add(api, "value", def);

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
