var end_x = x + lengthdir_x(length, angle);
var end_y = y + lengthdir_y(length, angle);

if (state == 0) {
    // Semi-transparent warning indicator
    draw_set_alpha(0.5);
    draw_line_width_color(x, y, end_x, end_y, current_width, color_glow, color_glow);
    draw_set_alpha(1.0);
} else {
    // Active or Fading Beam: Outer Glow + Bright Core
    draw_line_width_color(x, y, end_x, end_y, current_width + 8, color_glow, color_glow); // Glow
    draw_line_width_color(x, y, end_x, end_y, current_width, color_core, color_core);     // Core
    
    // Draw a bright cap circle at origin point
    draw_circle_color(x, y, (current_width / 2) + 4, color_glow, color_glow, false);
    draw_circle_color(x, y, current_width / 2, color_core, color_core, false);
}