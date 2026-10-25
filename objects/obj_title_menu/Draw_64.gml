
/// obj_title_menu — Draw GUI Event

var gw = display_get_gui_width();
var gh = display_get_gui_height();

var left = gw * 0.09;
var cy = gh * 0.5;

// Background.
draw_set_alpha(1);
draw_set_color(make_color_rgb(5, 8, 28));
draw_rectangle(0, 0, gw, gh, false);

// Starfield.
for (var i = 0; i < star_count; i++)
{
    var sx = star_x[i] * gw / 1512;
    var sy = star_y[i];

    draw_set_alpha(
        0.55 + 0.45 * sin(menu_time * 0.045 + i * 2.1)
    );
    draw_set_color(c_white);
    draw_circle(sx, sy, star_size[i], false);
}

// Planet and orbit.
var px = gw * 0.77;
var py = gh * 0.30;
var pr = min(gw, gh) * 0.15;

draw_set_alpha(0.15);
draw_set_color(make_color_rgb(90, 100, 255));
draw_circle(px, py, pr * 1.35, false);

draw_set_alpha(1);
draw_set_color(make_color_rgb(25, 40, 100));
draw_circle(px, py, pr, false);

draw_set_color(make_color_rgb(95, 135, 255));
draw_circle(px, py, pr, true);

draw_set_alpha(0.65);
draw_color = c_white;
draw_circle(px, py, pr * 1.22, true);

// Title.
draw_set_alpha(1);
draw_set_font(font_dialogue);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

draw_set_color(make_color_rgb(120, 205, 255));
draw_text(left, gh * 0.12, "THE");

draw_set_color(c_white);
draw_text(left, gh * 0.17, "SPACE ADVENTURE");

draw_set_font(font_spellcard);
draw_set_color(make_color_rgb(200, 155, 255));
draw_text(left, gh * 0.215, "MOONY'S DANMAKU CHRONICLES");

// Current page heading and choices.
var heading = "";
var count = 0;
var selected_text = "";
var description = "";

switch (menu_page)
{
    case "main":
        heading = "MAIN MENU";
        count = array_length(menu_items);
        break;
		
	case "practice_stage":
		heading = "SELECT PRACTICE STAGE";
		count = array_length(practice_stage_number);
		break;

    case "gamemode":
        heading = "SELECT GAME MODE";
        count = array_length(global.gamemode_names[0]);
        break;

    case "difficulty":
        heading = "SELECT DIFFICULTY";
        count = array_length(global.diff_names[0]);
        break;

    case "character":
        heading = "SELECT CHARACTER";
        count = array_length(character_names);
        break;

    case "shot":
        heading = "SELECT SHOT TYPE";
        count = array_length(shot_names);
        break;

    case "options":
        heading = "OPTIONS";
        count = 1;
        break;

    case "credits":
        heading = "CREDITS";
        count = 1;
        break;
}

draw_set_font(font_dialogue);
draw_set_color(c_white);
draw_text(left, gh * 0.32, heading);

var y0 = gh * 0.42;
var row_h = min(gh * 0.065, 70);

for (var i = 0; i < count; i++)
{
    var yy = y0 + i * row_h;
    var label = "";

    switch (menu_page)
    {
        case "main":
            label = menu_items[i];
            break;
			
		case "practice_stage":
		label = practice_stage_number[i]
			+ " — "
			+ practice_stage_name[i];
			break;

        case "gamemode":
            label = global.gamemode_names[0][i];
            break;

        case "difficulty":
            label = global.diff_names[0][i];
            break;

        case "character":
            label = character_names[i];
            break;

        case "shot":
            label = shot_names[i];
            break;

        case "options":
            label = "OPTIONS NOT IMPLEMENTED";
            break;

        case "credits":
            label = "A TSA DANMAKU PROJECT";
            break;
    }

    if (i == menu_index)
    {
        draw_set_alpha(0.80);
        draw_set_color(make_color_rgb(35, 85, 175));
        draw_rectangle(
            left - 10, yy - row_h * 0.36,
            gw * 0.48, yy + row_h * 0.36,
            false
        );

        draw_set_alpha(1);
        draw_set_color(make_color_rgb(130, 225, 255));
        draw_text(left, yy, ">");

        draw_set_color(c_white);
    }
    else
    {
        draw_set_alpha(0.85);
        draw_set_color(make_color_rgb(165, 185, 225));
    }

    draw_set_font(font_dialogue);
    draw_text(left + 28, yy, label);
}

/// Page descriptions, after the choice loop.

draw_set_alpha(1);
draw_set_font(font_spellcard);
draw_set_color(make_color_rgb(175, 195, 230));

var desc_y = y0 + count * row_h + 12;

switch (menu_page)
{
    case "gamemode":
        draw_text(
            left, desc_y,
            global.gamemode_desc[0][menu_index]
        );
        break;

    case "difficulty":
        draw_text(
            left, desc_y,
            global.diff_desc[0][menu_index]
        );
        break;

    case "shot":
    var panel_x = gw * 0.32;
    var panel_y = gh * 0.14;
    var panel_w = gw * 0.30;

    var desc = global.shot_desc[selected_shot];

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_alpha(1);

    // Shot title
    draw_set_font(font_dialogue);
    draw_set_color(c_white);
    draw_text(
        panel_x,
        panel_y,
        global.shot_names[selected_shot]
    );

    var text_y = panel_y + 45;
	var slot_h = 105;

    for (var j = 0; j < array_length(desc); j += 2)
    {
		text_y = panel_y + 38;

for (var k = 0; k < array_length(desc); k += 2)
{
    // Section heading
    draw_set_font(font_spellcard);
    draw_set_color(make_color_rgb(140, 175, 235));
    draw_text(panel_x, text_y, desc[j]);

    // Description
    draw_set_font(font_dialogue);
    draw_set_color(c_white);

    var body_y = text_y + 20;
    var line_sep = 6;

    draw_text_ext(
        panel_x,
        body_y,
        desc[j + 1],
        line_sep,
        panel_w
    );

    // Measure the actual wrapped text height using the same font and spacing
    var body_h = string_height_ext(
        desc[j + 1],
        line_sep,
        panel_w
    );

    // Start the next section after the description finishes
    text_y = body_y + body_h + 24;
}
    }

    draw_set_color(c_white);
	break;
}

// Controls.
draw_set_alpha(0.85);
draw_set_color(make_color_rgb(155, 175, 220));
draw_text(
    left, gh * 0.92,
    "UP / DOWN: SELECT     Z / ENTER: CONFIRM     X / ESC: BACK"
);

draw_set_alpha(1);
draw_set_font(font_dialogue);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
