//* Description *//
// Usage: collision_line_box(x1, y1, x2, y2, x3, y3, x4, y4, details);
// Function: Returns whether or not the specified Line collides with the specified Box
// Arguments:
// 1) x1 : int - The Start X Position of the Line
// 2) y1 : int - The Start Y Position of the Line
// 3) x2 : int - The End X Position of the Line
// 4) y2 : int - The End Y Position of the Line
// 5) x3 : int - The Left (or Right) Boundary of the specified Rectangle
// 6) y3 : int - The Top (or Bottom) Boundary of the specified Rectangle
// 7) x4 : int - The Right (or Left) Boundary of the specified Rectangle
// 8) y4 : int - The Bottom (or Top) Boundary of the specified Rectangle
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
// Check for Collision with any of the Bounding Box Lines
if(details)
{
    var collision = collision_line_line(x1, y1, x2, y2, x3, y3, x3, y4, true); // Left (or Right)
    if(ds_exists(collision, ds_type_map)) return collision;

    var collision = collision_line_line(x1, y1, x2, y2, x3, y3, x4, y3, true); // Top (or Bottom)
    if(ds_exists(collision, ds_type_map)) return collision;

    var collision = collision_line_line(x1, y1, x2, y2, x4, y3, x4, y4, true); // Right (or Left)
    if(ds_exists(collision, ds_type_map)) return collision;

    var collision = collision_line_line(x1, y1, x2, y2, x3, y4, x4, y4, true); // Bottom (or Top)
    if(ds_exists(collision, ds_type_map)) return collision;

    return noone;
}
else
{
    if(collision_line_line(x1, y1, x2, y2, x3, y3, x3, y4, false)) // Left (or Right)
        return true;
    else if(collision_line_line(x1, y1, x2, y2, x3, y3, x4, y3, false)) // Top (or Bottom)
        return true;
    else if(collision_line_line(x1, y1, x2, y2, x4, y3, x4, y4, false)) // Right (or Left)
        return true;
    else if(collision_line_line(x1, y1, x2, y2, x3, y4, x4, y4, false)) // Bottom (or Top)
        return true;
    else
        return false;
}
