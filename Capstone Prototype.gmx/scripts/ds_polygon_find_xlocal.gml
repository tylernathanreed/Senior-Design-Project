//* Description *//
// Usage: ds_polygon_find_xlocal(polygon, index);
// Function: Returns the Local X Position of the specified Point within the specified Polygon
// Arguments:
// 1) polygon : ds_polygon - The ID of the specified Polygon
// 2) index : int - The Index of the Point

//* Arguments *//
var polygon, index;

polygon = argument0;
index = round(real(argument1));

//* Main Body *//
// Make sure the Polygon Exists
if(!ds_polygon_exists(polygon))
    return 0;

// Validate the Index
if(clamp(index, 0, ds_polygon_size(polygon)) != index)
    return 0;

// Determine the X List of the Polygon
var xlist = ds_map_find_value(polygon, "xlist");

// Determine the Position of the Point
return ds_list_find_value(xlist, index);
