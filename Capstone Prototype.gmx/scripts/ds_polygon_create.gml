//* Description *//
// Usage: ds_polygon_create(xx, yy, xorigin, yorigin);
// Function: Creates and Returns an Empty Polygon
// Arguments:
// 1) xx : real - The X Position of the Polygon
// 2) yy : real - The Y Position of the Polygon
// 1) xorigin : int - The X Origin of the Polygon
// 2) yorigin : int - The Y Origin of the Polygon

//* Arguments *//
var xx, yy, xorigin, yorigin;

xx = real(argument0);
yy = real(argument1);
xorigin = round(real(argument2));
yorigin = round(real(argument3));

//* Main Body *//
// Create the Polygon Mask
var polygon = ds_map_create();

// Assign the Map Type
ds_map_add(polygon, "ds_type", ds_type_polygon);

// Add the Vertex Lists
ds_map_add(polygon, "xlist", ds_list_create());
ds_map_add(polygon, "ylist", ds_list_create());

// Add the Position
ds_map_add(polygon, "x", xx);
ds_map_add(polygon, "y", yy);

// Add the Origin
ds_map_add(polygon, "xorigin", xorigin);
ds_map_add(polygon, "yorigin", yorigin);

// Add the Rotation
ds_map_add(polygon, "rotation", 0);

// Return the Polygon
return polygon;
