//* Description *//
// Usage: line_distance(px, py, x1, y1, x2, y2)
// Function: Returns the Distance between the specified Point and specified Line
// Arguments:
// 1) px : int - The X Position of the Point
// 2) py : int - The Y Position of the Point
// 3) x1 : int - First X Coordinate of the Line
// 4) y1 : int - First Y Coordinate of the Line
// 5) x2 : int - Last X Coordinate of the Line
// 6) y2 : int - Last Y Coordinate of the Line

//* Arguments *//
var px, py, x1, y1, x2, y2;

px = round(real(argument0));
py = round(real(argument1));
x1 = round(real(argument2));
y1 = round(real(argument3));
x2 = round(real(argument4));
y2 = round(real(argument5));

//* Main Body *//
// Determine the Slope of the Line
var slope;

if(x1 - x2 != 0)
    slope = (y1 - y2)/(x1 - x2);
else
    slope = "undefined";

// Determine the Type of Line
if(string(slope) != "undefined" && real(slope) != 0) // Sloped Line
{
    // Formula:
    // y = mx + b -> j = slope*i + intercept

    // Determine the y-intercept
    var intercept = y1 - slope*x1; // Also y2 - slope*x2

    // Determine the Left and Right Bounds of the Line
    var xmin = min(x1, x2);
    var xmax = max(x1, x2);

    // Determine the Smallest Upper Bound
    var d1 = point_distance(px, py, x1, y1);
    var d2 = point_distance(px, py, x2, y2);
    var distance = min(d1, d2);

    for(var i = xmin + 1; i < xmax; i++)
    {
        // Determine the Current Distance
        var j = slope*i + intercept;

        var dist = point_distance(px, py, i, j);

        // Update the Distance if the Current Distance is Shorter
        if(dist < distance)
            distance = dist;
    }

    return distance;
}
else if(real(slope) == 0) // Horizontal Line
{
    var xmin = min(x1, x2);
    var xmax = max(x1, x2);

    // Determine the Distance from the Line
    if(mouse_x < xmin) // Check Left Bound
        return point_distance(px, py, xmin, y1);
    else if(mouse_x > xmax) // Check Right Bound
        return point_distance(px, py, xmax, y2);
    else // Center Bound
        return abs(mouse_y - y1);
}
else // Vertical Line
{
    var ymin = min(y1, y2);
    var ymax = max(y1, y2);

    // Determine the Distance from the Line
    if(mouse_y < ymin) // Check Top Bound
        return point_distance(px, py, ymin, x1);
    else if(mouse_y > ymax) // Check Bottom Bound
        return point_distance(px, py, ymax, x2);
    else // Center Bound
        return abs(mouse_x - x1);
}
