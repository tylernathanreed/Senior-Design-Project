//* Description *//
// Usage: ds_polygon_set_x(polygon, xx);
// Function: Sets the X Position of the specified Polygon
// Arguments:
// 1) polygon : ds_polygon - The ID of the specified Polygon
// 2) xx : real - The X Position to Move the Polygon

//* Arguments *//
var polygon, xx;

polygon = argument0;
xx = real(argument1);

//* Main Body *//
// Make sure the Polygon Exists
if(!ds_polygon_exists(polygon))
    return 0;

// Set the X Position of the Polygon
return ds_map_replace(polygon, "x", xx);
