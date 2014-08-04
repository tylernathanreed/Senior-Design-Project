//* Description *//
// Usage: physics_fixture_create_box(width, heigh, density, frict, restitution, ang_damping, lin_damping);
// Function: Creates the specified Box Fixture
// Arguments:
// 1) width : int - The Width of the specified Box
// 2) height : int - The Height of the specified Box
// 3) density : real - The Density of the specified Box
// 4) frict : real - The Friction of the specified Box
// 5) restitution : real - The Restitution (Bounciness) of the specified Box (0 - 1)
// 6) ang_damping : real - The Angular Damping of the specified Box
// 7) lin_damping : real - The Linear Damping of the specified Box

//* Arguments *//
var width, height, density, frict, restitution, ang_damping, lin_damping;

width = round(real(argument0));
height = round(real(argument1));
density = real(argument2);
frict = real(argument3);
restitution = real(argument4);
ang_damping = real(argument5);
lin_damping = real(argument6);

//* Main Body *//
// Create the Physics Fixture
var fixture = physics_fixture_create();

// Set the Fixture Shape
physics_fixture_set_box_shape(fixture, width/2, height/2);

// Set the Attributes of the Fixture
physics_fixture_set_density(fixture, density);
physics_fixture_set_friction(fixture, frict);
physics_fixture_set_restitution(fixture, restitution);
physics_fixture_set_angular_damping(fixture, ang_damping);
physics_fixture_set_linear_damping(fixture, lin_damping);

// Return the Fixture
return fixture;
