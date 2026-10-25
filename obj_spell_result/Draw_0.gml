draw_set_alpha(alpha);

draw_set_font(font_dialogue);
draw_set_halign(fa_center);

if (value > 0)
{
    draw_set_color(c_yellow);
}
else
{
    draw_set_color(c_red);
}

draw_text(200, 200, text);

if (value > 0)
{
    draw_text(200, 240, string_format_commas(value));
}

draw_set_halign(fa_left);
draw_set_alpha(1);