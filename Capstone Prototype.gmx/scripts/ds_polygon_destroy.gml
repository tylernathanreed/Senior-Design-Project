//* Description *//
// Usage: ds_polygon_destroy(polygon);
// Function: Destroys the specified Polygon
// Arguments:
// 1) polygon : ds_polygon - The ID of the specified Polygon

//* Arguments *//
var polygon;

polygon = argument0;

//* Main Body *//
// Make sure the Polygon Exists
if(!ds_polygon_exists(polygon))
    return false;

// Determine the Vertex Lists of the Polygon
var xlist, ylist;

xlist = ds_map_find_value(polygon, "xlist");
ylist = ds_map_find_value(polygon, "ylist");

// Destroy the Vertex Lists
ds_list_destroy(xlist);
ds_list_destroy(ylist);

// Destroy the Polygon Map
ds_map_destroy(polygon);

return true;
