//* Description *//
// Usage: ds_polygon_add(polygon, xx, yy);
// Function: Adds the specified Point to the specified Polygon
// Arguments:
// 1) polygon : ds_polygon - The ID of the specified Polygon
// 2) xx : real - The X Position of the specified Point
// 3) yy : real - The Y Position of the specified Point

//* Arguments *//
var polygon, xx, yy;

polygon = argument0;
xx = real(argument1);
yy = real(argument2);

//* Main Body *//
// Make sure the Polygon Exists
if(!ds_polygon_exists(polygon))
    return false;

// Determine the Vertex Lists of the Polygon
var xlist, ylist;

xlist = ds_map_find_value(polygon, "xlist");
ylist = ds_map_find_value(polygon, "ylist");

// Add the specified Point
ds_list_add(xlist, xx);
ds_list_add(ylist, yy);

return true;
