//* Description *//
// Usage: ds_polygon_find_ylocal(polygon, index);
// Function: Returns the Local Y Position of the specified Point within the specified Polygon
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

// Determine the Y List of the Polygon
var ylist = ds_map_find_value(polygon, "ylist");

// Determine the Position of the Point
return ds_list_find_value(ylist, index);
