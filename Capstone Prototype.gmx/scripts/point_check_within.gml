//* Description *//
// Usage: point_check_within(px, py, x1, y1, x2, y2, border);
// Function: Returns whether or not the specified Point is within the specified Rectangle
// Arguments:
// 1) px : int - The X Position of the Point
// 2) py : int - The Y Position of the Point
// 3) x1 : int - The Left (or Right) Boundary of the specified Rectangle
// 4) y1 : int - The Top (or Bottom) Boundary of the specified Rectangle
// 5) x2 : int - The Right (or Left) Boundary of the specified Rectangle
// 6) y2 : int - The Bottom (or Top) Boundary of the specified Rectangle
// 7) border : bool - Whether or not to consider the Border as part of the Rectangle

//* Arguments *//
var px, py, x1, y1, x2, y2, border;

px = round(real(argument0));
py = round(real(argument1));
x1 = round(real(argument2));
y1 = round(real(argument3));
x2 = round(real(argument4));
y2 = round(real(argument5));
border = real(argument6) != 0;

//* Main Body *//
// Determine the Boundaries of the Rectangle
var left, top, right, bottom;

left = min(x1, x2);
top = min(y1, y2);
right = max(x1, x2);
bottom = max(y1, y2);

// Determine whether or not to use the Border
if(border)
{
    // Determine whether or not the Point is within the specified Rectangle
    return px >= left && py >= top && px <= right && py <= bottom;
}
else
{
    // Determine whether or not the Point is within the specified Rectangle
    return px > left && py > top && px < right && py < bottom;
}
