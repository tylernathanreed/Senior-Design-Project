//* Description *//
// Usage: physics_fixture_create_polgyon(polygon, density, frict, restitution, ang_damping, lin_damping);
// Function: Creates the specified Polygon Fixture
// Arguments:
// 1) polygon : ds_polygon - The ID of the specified Polygon
// 3) density : real - The Density of the specified Polygon
// 4) frict : real - The Friction of the specified Polygon
// 5) restitution : real - The Restitution (Bounciness) of the specified Polygon (0 - 1)
// 6) ang_damping : real - The Angular Damping of the specified Polygon
// 7) lin_damping : real - The Linear Damping of the specified Polygon

//* Arguments *//
var polygon, density, frict, restitution, ang_damping, lin_damping;

polygon = argument0;
density = real(argument1);
frict = real(argument2);
restitution = real(argument3);
ang_damping = real(argument4);
lin_damping = real(argument5);

//* Main Body *//
// Make sure the Polygon Exists
if(!ds_polygon_exists(polygon))
    return noone;

// Create the Physics Fixture
var fixture = physics_fixture_create();

// Set the Fixture Shape
physics_fixture_set_polygon_shape(fixture);

// Add the Verticies
var count = ds_polygon_size(polygon);

for(var i = 0; i < count; i++)
{
    // Determine the Position of the Vertex
    var xx, yy;

    xx = ds_polygon_find_xlocal(polygon, i);
    yy = ds_polygon_find_ylocal(polygon, i);

    physics_fixture_add_point(fixture, xx, yy);
}

// Set the Attributes of the Fixture
physics_fixture_set_density(fixture, density);
physics_fixture_set_friction(fixture, frict);
physics_fixture_set_restitution(fixture, restitution);
physics_fixture_set_angular_damping(fixture, ang_damping);
physics_fixture_set_linear_damping(fixture, lin_damping);

// Return the Fixture
return fixture;
