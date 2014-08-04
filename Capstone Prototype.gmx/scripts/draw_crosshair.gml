//* Description *//
// Usage: draw_crosshair(xx, yy, x1, y1, x2, y2);
// Function: Draws the specified Crosshair
// Arguments:
// 1) xx : int - The X Position of the Crosshair
// 2) yy : int - The Y Position of the Crosshair
// 3) x1 : int - The Local Left (or Right) Edge of the Crosshair
// 4) y1 : int - The Local Top (or Bottom) Edge of the Crosshair
// 5) x2 : int - The Local Right (or Left) Edge of the Crosshair
// 6) y2 : int - The Local Bottom (or Top) Edge of the Crosshair

//* Arguments *//
var xx, yy, x1, y1, x2, y2;

xx = round(real(argument0));
yy = round(real(argument1));
x1 = round(real(argument2));
y1 = round(real(argument3));
x2 = round(real(argument4));
y2 = round(real(argument5));

//* Main Body *//
// Draw the Horizontal Line
draw_line(xx - x1, yy, xx + x2, yy);

// Draw the Vertical Line
draw_line(xx, yy - y1, xx, yy + y2);
