//* Description *//
// Usage: draw_line_dashed(x1, y1, x2, y2, gap);
// Function: Draws the specified Dashed Line
// Arguments:
// 1) x1 : int - The X Position of the First Point of the Line
// 2) y1 : int - The Y Position of the First Point of the Line
// 3) x2 : int - The X Position of the Second Point of the Line
// 4) y2 : int - The Y Position of the Second Point of the Line
// 5) gap : int - The Interval between Dashes

//* Arguments *//
var x1, y1, x2, y2, gap;

x1 = round(real(argument0));
y1 = round(real(argument1));
x2 = round(real(argument2));
y2 = round(real(argument3));
gap = round(real(argument4));

//* Main Body *//
// Determine the Distance and Direction of the Line
var dist, dir;

dist = point_distance(x1, y1, x2, y2);
dir = point_direction(x1, y1, x2, y2);

// Draw the Dashed Line
for(var i = 0; i < dist; i += gap * 2)
{
    // Determine the Segment Length
    var length = gap;
  
    if(i + length > dist)
        length = dist - i;

    // Determine the Line Attributes
    var xx1, yy1, xx2, yy2;

    xx1 = x1 + lengthdir_x(i, dir);
    yy1 = y1 + lengthdir_y(i, dir);
    xx2 = xx1 + lengthdir_x(length, dir);
    yy2 = yy1 + lengthdir_y(length, dir);

    // Draw the Line Segment
    draw_line(xx1, yy1, xx2, yy2);
}
