cx = 756 / 2;
cy = 504 / 2;

var can_continue =
    (global.gamemode == 1)
    && (global.continues_used < global.max_continues);

draw_set_font(font_dialogue);

if (can_continue)
{
    draw_set_color(c_white);
    draw_text(
        cx, cy + 10,
        "Continues remaining: "
        + string(global.max_continues - global.continues_used)
    );

    draw_set_color(menu_index == 0 ? c_yellow : c_white);
    draw_text(cx - 50, cy + 55, "Continue");

    draw_set_color(menu_index == 1 ? c_yellow : c_white);
    draw_text(cx + 50, cy + 55, "Quit");
}
else
{
    draw_set_color(c_gray);
    draw_text(cx - 50, cy + 55, "Continue");

    draw_set_color(c_yellow);
    draw_text(cx + 50, cy + 55, "Quit");

    draw_set_color(c_white);
    draw_text(cx, cy + 10, "No continues remaining");
}

draw_set_color(c_white);
draw_set_halign(fa_left);
