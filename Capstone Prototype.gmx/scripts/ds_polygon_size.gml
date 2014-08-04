//* Description *//
// Usage: ds_polygon_size(polygon);
// Function: Returns the Number of Vertices in the Polygon
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

// Return the Minimal Size of the Polygon
return min(ds_list_size(xlist), ds_list_size(ylist));
