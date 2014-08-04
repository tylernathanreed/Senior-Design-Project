//* Description *//
// Usage: collision_line_polygon(x1, y1, x2, y2, polygons, details);
// Function: Returns a Map or Boolean containing Information about the Collision (if one Exists)
// Arguments:
// 1) x1 : int - The Start X Position of the Line
// 2) y1 : int - The Start Y Position of the Line
// 3) x2 : int - The End X Position of the Line
// 4) y2 : int - The End Y Position of the Line
// 5) polygons : ds_list - The ID of the List of Polygons
// 6) details : boolean - Whether or not to provide Details of the Collision

//* Arguments *//
var x1, y1, x2, y2, polygons;

x1 = round(real(argument0));
y1 = round(real(argument1));
x2 = round(real(argument2));
y2 = round(real(argument3));
polygons = argument4;
details = real(argument5) != 0;

//* Main Body *//
// Make sure the List of Polygons Exists
if(!ds_exists(polygons, ds_type_list))
{
    // Determine whether or not to return Details
    if(details)
        return noone;
    else
        return false;
}

// Determine the Number of Polygons
var count = ds_list_size(polygons);

// Iterate through the Polygons
for(var i = 0; i < count; i++)
{
    // Determine the Current Polygon
    var polygon = ds_list_find_value(polygons, i);

    // Make sure the Polygon Exists
    if(!ds_polygon_exists(polygon))
        continue;

    // Determine the Position of the Polygon
    var xx, yy;

    xx = ds_polygon_get_x(polygon);
    yy = ds_polygon_get_y(polygon);

    // Determine the Number of Vertices in the Polygon
    var size = ds_polygon_size(polygon);

    // Determine the Bounding Box of the Polygon
    var left = xx, top = yy, right = xx, bottom = yy;

    for(var j = 0; j < size; j++)
    {
        // Determine the Current Point
        var px, py;

        px = ds_polygon_find_x(polygon, j);
        py = ds_polygon_find_y(polygon, j);

        // Update the Bounding Box
        if(left > px) left = px;
        if(top > py) top = py;
        if(right < px) right = px;
        if(bottom < py) bottom = py;
    }

    // Determine whether or not the Line Collides with the Bounding Box of the Polygon
    if(!collision_line_box(x1, y1, x2, y2, left, top, right, bottom, false))
        continue;


    // Determine whether or not the Line Collides with the Polygon
    for(var j = 0; j < size; j++)
    {
        // Determine the Current Line
        var x3, y3, x4, y4;

        x3 = ds_polygon_find_x(polygon, j);
        y3 = ds_polygon_find_y(polygon, j);
        x4 = ds_polygon_find_x(polygon, (j + 1) mod size);
        y4 = ds_polygon_find_y(polygon, (j + 1) mod size);

        // Determine whether or not the Line Collides with the Current Line
        var collision = collision_line_line(x1, y1, x2, y2, x3, y3, x4, y4, details);

        // Determine whether or not to return Details
        if(details)
        {
            if(ds_exists(collision, ds_type_map))
            {
                // Create the Return Map
                var map = ds_map_create();
    
                // Store the Collision Details
                ds_map_add(map, "polygon", polygon);
                ds_map_add(map, "x", ds_map_find_value(collision, "x"));
                ds_map_add(map, "y", ds_map_find_value(collision, "y"));

                // Destroy the Line Collision Details
                ds_map_destroy(collision);

                return map;
            }
        }
        else if(collision)
            return true;
    }
}

// Determine whether or not to return Details
if(details)
    return noone;
else
    return false;
