//* Description *//
// Usage: ds_polygon_exists(polygon);
// Function: Returns whether or not the specified Polygon Exists
// Arguments:
// 1) polygon : ds_polygon - The ID of the specified Polygon

//* Arguments *//
var polygon;

polygon = argument0;

//* Main Body *//
// Make sure the Polygon Exists as a Map
if(!ds_exists(polygon, ds_type_map))
    return false;

// Make sure the Polygon is Marked as a Polygon
if(!ds_map_exists(polygon, "ds_type") || ds_map_find_value(polygon, "ds_type") != ds_type_polygon)
    return false;

// Assume the Polygon Exists
return true;
