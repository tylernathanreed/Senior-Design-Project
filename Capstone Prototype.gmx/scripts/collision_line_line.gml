//* Description *//
// Usage: collision_line_line(x1, y1, x2, y2, x3, y3, x4, y4, details);
// Function: Returns whether or not the specified Lines Collide
// Arguments:
// 1) x1 : int - The Start X Position of the First Line
// 2) y1 : int - The Start Y Position of the First Line
// 3) x2 : int - The End X Position of the First Line
// 4) y2 : int - The End Y Position of the First Line
// 5) x3 : int - The Start X Position of the Second Line
// 6) y3 : int - The Start Y Position of the Second Line
// 7) x4 : int - The End X Position of the Second Line
// 8) y4 : int - The End Y Position of the Second Line
// 9) details : boolean - Whether or not to provide Details of the Collision

//* Arguments *//
var x1, y1, x2, y2, x3, y3, x4, y4;

x1 = round(real(argument0));
y1 = round(real(argument1));
x2 = round(real(argument2));
y2 = round(real(argument3));
x3 = round(real(argument4));
y3 = round(real(argument5));
x4 = round(real(argument6));
y4 = round(real(argument7));
details = real(argument8) != 0;

//* Main Body *//
// Determine the Line Segments
var lx1, ly1, lx2, ly2;

lx1 = x1 - x2;
ly1 = y1 - y2;
lx2 = x3 - x4;
ly2 = y3 - y4;

// Determine the Segment Coefficients
var c1, c2;

c1 = x1 * y2 - y1 * x2;
c2 = x3 * y4 - y3 * x4;

// Determine the Axial Difference
var axis = lx1 * ly2 - ly1 * lx2;

// Make sure the Lines are not Parallel
if(axis == 0)
{
    // Determine whether or not to return Details
    if(details)
        return noone;
    else
        return false;
}

// Determine the Point of Intersection
var px, py;

px = (c1 * lx2 - lx1 * c2) / axis;
py = (c1 * ly2 - ly1 * c2) / axis;

// Make sure the Point lies on the Line Segments
if(!point_check_within(px, py, x1, y1, x2, y2, true) || !point_check_within(px, py, x3, y3, x4, y4, true))
{
    // Determine whether or not to return Details
    if(details)
        return noone;
    else
        return false;
}

// Determine whether or not to return Details
if(details)
{
    // Create the Return Map
    var map = ds_map_create();

    // Add the Collision Details
    ds_map_add(map, "x", px);
    ds_map_add(map, "y", py);

    return map;
}
else
    return true;
