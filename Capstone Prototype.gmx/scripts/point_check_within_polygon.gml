//* Description *//
// Usage: point_check_within_polygon(px, py, polygon);
// Function: Returns whether or not the specified Point is over the specified Polygon
// Arguments:
// 1) px : int - The X Position of the Point
// 2) py : int - The Y Position of the Point
// 3) polygon : ds_polygon - The ID of the specified Polygon

//* Arguments *//
var px, py, polygon;

px = round(real(argument0));
py = round(real(argument1));
polygon = argument2;

//* Main Body *//
// Make sure the Polygon Exists
if(!ds_polygon_exists(polygon))
    return false;

// Initialize the 'Over' Flag
var over = false;

// Determine the Number of Points
var count = ds_polygon_size(polygon);

// Make sure enough Points exist to form a Polygon
if(count <= 2)
    return false;

// Determine the Bounding Box of the Polygon
var left, top, right, bottom;

left = room_width * 10;
top = room_height * 10;
right = -room_width * 10;
bottom = -room_height * 10;

for(var i = 0; i < count; i++)
{
    // Determine the Position of the Current Point
    var xx, yy;

    xx = ds_polygon_find_x(polygon, i);
    yy = ds_polygon_find_y(polygon, i);

    // Update the Bounding Box
    if(xx < left) left = xx;
    if(yy < top) top = yy;
    if(xx > right) right = xx;
    if(yy > bottom) bottom = yy;
}

// Make sure the Point is within the Bounding Box of the Polygon
if(!point_check_within(px, py, left, top, right, bottom, true))
    return false;

// Initialize the Previous Point Iterator
var j = count - 1;

for(var i = 0; i < count; i += 1)
{
    // Determine the Position of the Current Line
    var x1, y1, x2, y2;

    x1 = ds_polygon_find_x(polygon, i);
    y1 = ds_polygon_find_y(polygon, i);
    x2 = ds_polygon_find_x(polygon, j);
    y2 = ds_polygon_find_y(polygon, j);

    // Remove Duplicate Points
    if(x1 == x2 && y1 == y2)
    {
        // Delete Current Point
        ds_polygon_remove(polygon, i);

        // Decrement Point Count
        count--;

        // Try Again
        continue;
    }

    // Determine the Boundary of the Line
    var line_left, line_top, line_right, line_bottom;

    line_left = min(x1, y2);
    line_top = min(y1, y2);
    line_right = max(x1, x2);
    line_bottom = max(y1, y2);

    // Make sure the Point is within the Bounding Box of the Line
    if(!point_check_within(px, py, left, line_top, right, line_bottom, true))
    {
        j = i;
        continue;
    }

    // Ignore Boundary Points
    if((py == top || py == bottom) && (px == x1 || px == x2))
    {
        j = i;
        continue;
    }

    // Determine the Vertical Position of the Previous and Next Points
    var yprev, ynext;

    yprev = y2;
    ynext = ds_polygon_find_y(polygon, (i + 1) mod count);

    // Determine whether or not to Ignore the Point as an Intersection
    var ignore = y1 <= min(yprev, ynext) || y1 >= max(yprev, ynext);

    // Determine the Slope of the Line
    var slope;

    if(y2 - y1 == 0)
        slope = "horizontal";
    else
        slope = (py - y1)/(y2 - y1);

    // Determine the Horizontal Intersection with the Point
    var lx;

    if(is_real(slope))
        lx = x1 + slope * (x2 - x1);
    else
        lx = x1;

    // Determine whether or not the Point Axis intersects with the Line
    if(lx < px && lx != x1 && lx != x2)
        over = !over;

    // Count Convex Edge Points
    else if(lx < px && (lx == x1 && !ignore))
        over = !over;

    // Update Previous Point Iterator
    j = i;
}

return over;
