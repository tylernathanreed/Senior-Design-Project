//* Description *//
// Usage: ds_polygon_set_y(polygon, yy);
// Function: Sets the Y Position of the specified Polygon
// Arguments:
// 1) polygon : ds_polygon - The ID of the specified Polygon
// 2) yy : real - The Y Position to Move the Polygon

//* Arguments *//
var polygon, yy;

polygon = argument0;
yy = real(argument1);

//* Main Body *//
// Make sure the Polygon Exists
if(!ds_polygon_exists(polygon))
    return 0;

// Set the Y Position of the Polygon
return ds_map_replace(polygon, "y", yy);
