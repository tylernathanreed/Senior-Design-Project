//* Description *//
// Usage: sprite_get_bbox_polygon(sprite, xscale, yscale, mask_type)
// Function: Returns the Polygon Representation of the specified Collision Mask
// Arguments:
// 1) sprite : id - The ID of the specified Sprite
// 2) xscale : real - The X Scale of the specified Sprite
// 3) yscale : real - The Y Scale of the specified Sprite
// 4) mask_type : const - The Collision Mask Type of the Sprite (Cannot be Derived)

//* Arguments *//
var sprite, xscale, yscale, mask_type;

sprite = argument0;
xscale = real(argument1);
yscale = real(argument2);
mask_type = argument3;

//* Main Body *//
// Make sure the Sprite Exists
if(!sprite_exists(sprite))
    return noone;

// Determine the Origin of the Polygon
var xorigin, yorigin;

xorigin = 0;
yorigin = 0;

// Create the Polygon Map
var polygon = ds_polygon_create(0, 0, xorigin, yorigin);

// Determine the Dimensions of the BBox
var width, height;

width = sprite_get_bbox_right(sprite) - sprite_get_bbox_left(sprite) + 1;
height = sprite_get_bbox_bottom(sprite) - sprite_get_bbox_top(sprite) + 1;

// Scale the Dimensions of the BBox
width *= xscale;
height *= yscale;

// Add the Polygon Points
switch(mask_type)
{
    case MASK_RECTANGLE:
        // Add the Four Corners
        ds_polygon_add(polygon, -width/2, -height/2); // Top-Left
        ds_polygon_add(polygon, width/2, -height/2); // Top-Right
        ds_polygon_add(polygon, width/2, height/2); // Bottom-Right
        ds_polygon_add(polygon, -width/2, height/2); // Bottom-Left
        break;

    case MASK_ELLIPSE:
        // Determine the Ellipse Precision
        var precision = 24;

        // Add the Ellipse in a Clock-Wise Motion
        for(var i = 0; i < precision; i++)
        {
            // Determine the Current Angle (in Radians)
            var angle = i / precision * 2 * pi;

            // Determine the Position of the Point
            var xx, yy;

            xx = cos(angle) * width/2;
            yy = sin(angle) * height/2;

            // Add the Point
            ds_polygon_add(polygon, xx, yy);
        }
        break;

    case MASK_DIAMOND:
        // Add the Four Corners
        ds_polygon_add(polygon, 0, -height/2); // Top
        ds_polygon_add(polygon, width/2, 0); // Right
        ds_polygon_add(polygon, 0, height/2); // Bottom
        ds_polygon_add(polygon, -width/2, 0); // Left
        break;

    case MASK_PRECISE: // Calling Instance will have to create the Polygon itself
    default: // Unknown Mask Type
        // Destroy the Polygon
        ds_polygon_destroy(polygon);

        // Return Non-Existant Structure
        return noone;
}

return polygon;
