//* Description *//
// Usage: ds_polygon_remove(polygon, index);
// Function: Removes the specified Point from the specified Polygon
// Arguments:
// 1) polygon : ds_polygon - The ID of the specified Polygon
// 2) index : int - The Index of the specified Point

//* Arguments *//
var polygon, index;

polygon = argument0;
index = round(real(argument1));

//* Main Body *//
// Make sure the Polygon Exists
if(!ds_polygon_exists(polygon))
    return false;

// Determine the Vertex Lists of the Polygon
var xlist, ylist;

xlist = ds_map_find_value(polygon, "xlist");
ylist = ds_map_find_value(polygon, "ylist");

// Validate the Index
if(index < 0 || index > ds_polygon_size(polygon))
    return false;

// Remove the specified Point
ds_list_delete(xlist, index);
ds_list_delete(ylist, index);

return true;
