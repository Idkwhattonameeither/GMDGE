// Setup properties (can be set dynamically on instance_create_depth)
cutin_sprite = sprite_john_splash; 

timer = 0;
duration = 70; // Total duration in frames (1 second at 60 FPS)

// Positions relative to GUI
gui_w = display_get_gui_width();   // 756
gui_h = display_get_gui_height();  // 504

// Horizontal slide points
start_x  = -200;                  // Off-screen left
mid_x    = 120;                   // Entry display spot
end_x    = gui_w + 200;           // Off-screen right

current_x = start_x;
alpha = 0;