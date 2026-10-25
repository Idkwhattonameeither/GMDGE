
var gw = display_get_gui_width();
var gh = display_get_gui_height();
var total = array_length(global.replay_files);

draw_set_alpha(1);
draw_set_color(make_color_rgb(5, 8, 28));
draw_rectangle(0, 0, gw, gh, false);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_font(font_dialogue);
draw_set_color(make_color_rgb(120, 205, 255));
draw_text(gw * 0.5, gh * 0.12, "THE SPACE ADVENTURE");

draw_set_color(c_white);
draw_text(gw * 0.5, gh * 0.20, "REPLAY SELECT");

draw_set_font(font_spellcard);

if (total == 0)
{
    draw_set_color(make_color_rgb(155, 175, 220));
    draw_text(gw * 0.5, gh * 0.48,
        "NO REPLAYS FOUND");

    draw_text(gw * 0.5, gh * 0.54,
        "COMPLETE A RUN TO RECORD A REPLAY");
}
else
{
    var _visible = min(total, 12);

    for (var i = 0; i < _visible; i++)
    {
        var yy = gh * 0.32 + i * 30;

        if (i == replay_index)
        {
            draw_set_color(make_color_rgb(130, 225, 255));
            draw_text(gw * 0.5, yy, "> "
                + global.replay_files[i]);
        }
        else
        {
            draw_set_color(make_color_rgb(165, 185, 225));
            draw_text(gw * 0.5, yy,
                global.replay_files[i]);
        }
    }
}

draw_set_color(make_color_rgb(155, 175, 220));
draw_text(gw * 0.5, gh * 0.92,
    "UP / DOWN: SELECT   Z / ENTER: WATCH   X / ESC: BACK");

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(1);
draw_set_color(c_white);
