//* Description *//
// Usage: draw_rectangle_dashed(x1, y1, x2, y2, gap);
// Function: Draws the specified Dashed Rectangle
// Arguments:
// 1) x1 : int - The Left (or Right) Boundary of the specified Rectangle
// 2) y1 : int - The Top (or Bottom) Boundary of the specified Rectangle
// 3) x2 : int - The Right (or Left) Boundary of the specified Rectangle
// 4) y2 : int - The Bottom (or Top) Boundary of the specified Rectangle
// 5) gap : int - The Interval between Dashes

//* Arguments *//
var x1, y1, x2, y2, gap;

x1 = round(real(argument0));
y1 = round(real(argument1));
x2 = round(real(argument2));
y2 = round(real(argument3));
gap = round(real(argument4));

//* Main Body *//
// Draw the Rectangle Segments
draw_line_dashed(x1, y1, x2, y1, gap); // Top
draw_line_dashed(x1, y1, x1, y2, gap); // Left
draw_line_dashed(x1, y2, x2, y2, gap); // Bottom
draw_line_dashed(x2, y1, x2, y2, gap); // Right
