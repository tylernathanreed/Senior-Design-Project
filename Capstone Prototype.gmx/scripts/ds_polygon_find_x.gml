//* Description *//
// Usage: ds_polygon_find_x(polygon, index);
// Function: Returns the X Position of the specified Point within the specified Polygon
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

// Determine the Vertex Lists of the Polygon
var xlist, ylist;

xlist = ds_map_find_value(polygon, "xlist");
ylist = ds_map_find_value(polygon, "ylist");

// Determine the Position of the Point
var xx, yy;

xx = ds_list_find_value(xlist, index);
yy = ds_list_find_value(ylist, index);

// Determine the Origin of the Polygon
var xorigin, yorigin;

xorigin = ds_map_find_value(polygon, "xorigin");
yorigin = ds_map_find_value(polygon, "yorigin");

// Determine the Distance and Direction to the Origin
var dist, dir;

dist = point_distance(xorigin, yorigin, xx, yy);
dir = point_direction(xorigin, yorigin, xx, yy);

// Determine the Rotation of the Polygon
var rotation = ds_map_find_value(polygon, "rotation");

// Rotate the Point about the Origin
xx = xorigin + lengthdir_x(dist, dir + rotation);

// Offset the Point by the Position
xx += ds_map_find_value(polygon, "x");

return xx;
