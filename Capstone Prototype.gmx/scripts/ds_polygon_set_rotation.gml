//* Description *//
// Usage: ds_polygon_set_rotation(polygon, rotation);
// Function: Sets the Rotation of the specified Polygon
// Arguments:
// 1) polygon : ds_polygon - The ID of the specified Polygon
// 2) rotation : real - The New Rotation of the Polygon

//* Arguments *//
var polygon, rotation;

polygon = argument0;
rotation = real(argument1);

//* Main Body *//
// Make sure the Polygon Exists
if(!ds_polygon_exists(polygon))
    return 0;

// Set the Rotation of the Polygon
return ds_map_replace(polygon, "rotation", rotation);
