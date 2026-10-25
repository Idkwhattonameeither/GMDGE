
/// obj_leaderboard_screen — Draw GUI

var gw = display_get_gui_width();
var gh = display_get_gui_height();

// Background
draw_set_alpha(1);
draw_set_color(make_color_rgb(5, 8, 28));
draw_rectangle(0, 0, gw, gh, false);

// Decorative stars
for (var i = 0; i < 45; i++)
{
    var sx = (i * 137 + menu_time * (i mod 3 + 1)) mod gw;
    var sy = (i * 83) mod gh;

    draw_set_alpha(
        0.35 + 0.4 * sin(menu_time * 0.04 + i)
    );
    draw_set_color(c_white);
    draw_circle(sx, sy, (i mod 3) + 1, false);
}

draw_set_alpha(1);

// Header
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(font_dialogue);

draw_set_color(make_color_rgb(120, 205, 255));
draw_text(gw * 0.5, gh * 0.10, "THE SPACE ADVENTURE");

draw_set_color(c_white);
draw_text(gw * 0.5, gh * 0.18, "HIGH SCORES");

// Tabs
var normal_color = view_mode == 0
    ? make_color_rgb(130, 225, 255)
    : make_color_rgb(130, 145, 180);

var practice_color = view_mode == 1
    ? make_color_rgb(130, 225, 255)
    : make_color_rgb(130, 145, 180);

draw_set_color(normal_color);
draw_text(gw * 0.35, gh * 0.28, "NORMAL");

draw_set_color(practice_color);
draw_text(gw * 0.65, gh * 0.28, "PRACTICE");

// Choose leaderboard
var records = leaderboard_get_filtered(
    view_mode == 1,
    difficulty_filter,
    shot_filter
);

// Column headings
draw_set_font(font_spellcard);
draw_set_color(make_color_rgb(200, 155, 255));

draw_text(gw * 0.13, gh * 0.36, "RANK");
draw_text(gw * 0.25, gh * 0.36, "PLAYER");
draw_text(gw * 0.68, gh * 0.36, "SCORE");
draw_text(gw * 0.87, gh * 0.36, "STAGE");

draw_set_font(font_spellcard);
draw_set_color(make_color_rgb(200, 155, 255));

draw_text(
    gw * 0.5, gh * 0.32,
    global.diff_names[0][difficulty_filter]
    + "   |   MOONY "
    + global.shot_type_names[shot_filter]
);

// Records
draw_set_font(font_dialogue);

for (var i = 0; i < 10; i++)
{
    var yy = gh * 0.42 + i * gh * 0.045;

    if (i < array_length(records))
    {
        var entry = records[i];

        draw_set_color(
            i == 0
                ? make_color_rgb(255, 220, 130)
                : c_white
        );

        draw_text(gw * 0.13, yy, string(i + 1));
        draw_text(gw * 0.25, yy, entry.name);
        draw_text(gw * 0.68, yy, string(entry.score));
		
		if(!entry.cleared){
        draw_text(gw * 0.87, yy, "Stage " + string(entry.stage_reached));
		}
		else draw_text(gw * 0.87, yy, string("Clear"));
	}
    else
    {
        draw_set_color(make_color_rgb(85, 100, 135));

        draw_text(gw * 0.13, yy, string(i + 1));
        draw_text(gw * 0.25, yy, "----------");
        draw_text(gw * 0.68, yy, "----------");
        draw_text(gw * 0.87, yy, "---");
    }
}

// Footer
draw_set_font(font_spellcard);
draw_set_color(make_color_rgb(155, 175, 220));

draw_text(
    gw * 0.5, gh * 0.94,
    "UP/DOWN: DIFFICULTY   Q/E: SHOT   LEFT/RIGHT: BOARD   X: BACK"
);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(1);
draw_set_color(c_white);