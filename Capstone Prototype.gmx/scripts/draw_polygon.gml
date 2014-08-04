//* Description *//
// Usage: draw_polygon(polygon);
// Function: Draws the specified Polygon
// Arguments:
// 1) polygon - ds_polygon - The ID of the specified Polygon

//* Arguments *//
var polygon;

polygon = argument0;

//* Main Body *//
// Make sure the Polygon Exists
if(!ds_polygon_exists(polygon))
{
    show_debug_message("Warning! Attempt to Draw Non-Existant Polygon '" + string(polygon) + "'");
    return false;
}

// Determine the Number of Vertices
var count = ds_polygon_size(polygon);

// Make sure enough Lines Exist to Draw a Polygon
if(count < 2)
    return false;

// Begin Drawing the Polygon
draw_primitive_begin(pr_linestrip);

// Draw the Lines of the Polygon
for(var i = 0; i < count; i++)
{
    // Determine the Position of the Current Vertex
    var vx, vy;

    vx = ds_polygon_find_x(polygon, i);
    vy = ds_polygon_find_y(polygon, i);

    draw_vertex(vx, vy);
}

// Draw the First Vertex to Close the Polygon
var vx, vy;

vx = ds_polygon_find_x(polygon, 0);
vy = ds_polygon_find_y(polygon, 0);

draw_vertex(vx, vy);

// Stop Drawing the Polygon
draw_primitive_end();

// Determine the Origin of the Polygon
var xorigin, yorigin;

xorigin = ds_polygon_get_xorigin(polygon);
yorigin = ds_polygon_get_yorigin(polygon);

// Determine the Position of the Polygon
var xx, yy;

xx = ds_polygon_get_x(polygon);
yy = ds_polygon_get_y(polygon);

// Draw the Origin
draw_crosshair(xx + xorigin, yy + yorigin, 2, 2, 2, 2);

return true;
