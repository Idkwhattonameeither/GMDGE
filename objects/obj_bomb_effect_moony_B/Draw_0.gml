if (!instance_exists(obj_moony_day_player_shmup) && !instance_exists(id)) exit;

// Outer Aqua Glow Layer
draw_set_alpha(0.8);
draw_set_color(c_fuchsia);

// Draw main beam rectangle extending upward
draw_rectangle(x - beam_width, 0, x + beam_width, y - beam_width, false);

// Draw rounded base circle at the player's position
draw_circle(x, y - beam_width, beam_width, false);


// Inner Bright White Core Layer
draw_set_color(c_white);

// Draw inner core rectangle
draw_rectangle(x - (beam_width * 0.4), 0, x + (beam_width * 0.4), y - beam_width, false);

// Draw inner base core circle
draw_circle(x, y - beam_width, beam_width * 0.4, false);

draw_set_alpha(1.0);