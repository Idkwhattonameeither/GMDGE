// Calculate Tail Coordinates
var tail_x = x - lengthdir_x(current_len, dir);
var tail_y = y - lengthdir_y(current_len, dir);

// Draw Outer Glow (Thicker Line)
draw_set_alpha(0.5);
draw_line_width_color(x, y, tail_x, tail_y, width + 2, color_glow, color_glow);
draw_set_alpha(1);

// Draw Bright Inner Core (Thinner Line)
draw_line_width_color(x, y, tail_x, tail_y, width, color_core, color_core);

// Draw Rounded End Caps (Gives the laser segment polished "capsule" ends)
draw_circle_color(x, y, (width + 2) / 2, color_glow, color_glow, false);
draw_circle_color(x, y, width / 2, color_core, color_core, false);

draw_circle_color(tail_x, tail_y, (width + 2) / 2, color_glow, color_glow, false);
draw_circle_color(tail_x, tail_y, width / 2, color_core, color_core, false);