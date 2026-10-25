// Enable additive blending for glowing energy appearance
if state == "shoot"{
gpu_set_blendmode(bm_add);
draw_set_alpha(0.25);

// 1. Draw Outer Glow (Thicker, colored line)
draw_line_width_color(x, y, after_x, after_y, laser_width + 4, glow_color, glow_color);

// 2. Draw Inner Core (Thinner, pure white line)
draw_line_width_color(x, y, after_x, after_y, laser_width, core_color, core_color);

// 3. Draw Rounded End Caps (Prevents harsh flat line ends)
draw_circle_color(x, y, (laser_width + 6) / 2, glow_color, glow_color, false);
draw_circle_color(x, y, (laser_width + 6) / 2, glow_color, glow_color, false);
draw_circle_color(x, y, laser_width / 2, core_color, core_color, false);
draw_circle_color(x, y, laser_width / 2, core_color, core_color, false);

// Reset blend mode back to normal
gpu_set_blendmode(bm_normal);
draw_set_alpha(1);
}