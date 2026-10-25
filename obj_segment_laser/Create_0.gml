// Movement & Geometry
dir = 270;              // Travel angle
move_speed = 7;         // Speed once detached
max_len = 140;          // Maximum beam segment length (in pixels)
current_len = 0;        // Spawns at 0 and grows out
width = 3;              // Thickness of the inner core

// Lifecycle States: 0 = GROWING (stretching from source), 1 = FLYING (detached), 2 = FADING
state = 0;
extra = "attack";
grow_speed = 14;        // How fast the front stretches before detaching
grazed = false;
grazed_taser = false;
grazed_time = 0;

// Aesthetics
color_core = c_white;
color_glow = c_lime;    // Perfect for green target-lock / plasma bolts