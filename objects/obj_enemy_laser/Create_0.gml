// Laser properties (can be overridden by boss when spawning)
length = 800;           // Reach across the screen
max_width = 14;         // Full beam thickness when active
current_width = 2;      // Starting warning thickness
angle = 270;            // Beam direction (270 = straight down)
rot_speed = 0;          // Degrees per step (set > 0 for sweeping/rotating lasers)

// Timing (in frames at 60 FPS)
timer = 0;
warn_time = 40;         // Warning line duration
active_time = 80;       // Deadly active beam duration
fade_time = 15;         // Fading out duration
move_state = "attack";
move_timer = 120;

// State machine: 0 = Warning, 1 = Active, 2 = Fading
state = 0; 
circle_spawned = false;
circle = noone;

// Colors
color_core = c_white;   // Inner beam core
color_glow = c_aqua;    // Outer laser glow (e.g., cyan/red/yellow)

graze_timer = 0;
graze_cooldown = 4;