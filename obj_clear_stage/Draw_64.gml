var alpha = 1;
var progress = 0;

// fade logic
if (timer < fade_in_time)
{
    progress = timer / fade_in_time;
    alpha = progress;
}
else if (timer < fade_in_time + hold_time)
{
    progress = 1;
    alpha = 1;
}
else
{
    var t = timer - (fade_in_time + hold_time);
    alpha = 1 - (t / fade_out_time);
    progress = 1; // stop moving during fade out
}

draw_set_alpha(alpha);
draw_set_halign(fa_middle);
draw_set_color(c_yellow);
draw_set_font(font_dialogue);
draw_text(base_x, base_y, "STAGE CLEAR");
draw_set_font(font_spellcard);
draw_text(base_x, base_y + 15, "Clear Bonus");
draw_set_font(font_dialogue);
draw_text(base_x, base_y + 45, string_format_commas(value));

// reset
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_color(c_white);