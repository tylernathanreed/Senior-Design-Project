//* Description *//
// Usage: ds_polygon_get_rotation(polygon);
// Function: Returns the Rotation of the specified Polygon
// Arguments:
// 1) polygon : ds_polygon - The ID of the specified Polygon

//* Arguments *//
var polygon;

polygon = argument0;

//* Main Body *//
// Make sure the Polygon Exists
if(!ds_polygon_exists(polygon))
    return 0;

// Return the Rotation of the Polygon
return ds_map_find_value(polygon, "rotation");
