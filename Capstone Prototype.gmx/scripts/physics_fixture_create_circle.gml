//* Description *//
// Usage: physics_fixture_create_circle(radius, density, frict, restitution, ang_damping, lin_damping);
// Function: Creates the specified Circle Fixture
// Arguments:
// 1) radius : int - The Radius of the specified Circle
// 2) density : real - The Density of the specified Circle
// 3) frict : real - The Friction of the specified Circle
// 4) restitution : real - The Restitution (Bounciness) of the specified Circle (0 - 1)
// 5) ang_damping : real - The Angular Damping of the specified Circle
// 6) lin_damping : real - The Linear Damping of the specified Circle

//* Arguments *//
var radius, density, frict, restitution, ang_damping, lin_damping;

radius = round(real(argument0));
density = real(argument1);
frict = real(argument2);
restitution = real(argument3);
ang_damping = real(argument4);
lin_damping = real(argument5);

//* Main Body *//
// Create the Physics Fixture
var fixture = physics_fixture_create();

// Set the Fixture Shape
physics_fixture_set_circle_shape(fixture, radius);

// Set the Attributes of the Fixture
physics_fixture_set_density(fixture, density);
physics_fixture_set_friction(fixture, frict);
physics_fixture_set_restitution(fixture, restitution);
physics_fixture_set_angular_damping(fixture, ang_damping);
physics_fixture_set_linear_damping(fixture, lin_damping);

// Return the Fixture
return fixture;
