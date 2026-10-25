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

// ease-out movement (smooth stop)
var move = 20 * (1 - power(1 - progress, 2)); 

// draw shadow
draw_set_alpha(alpha);
draw_set_color(c_gray);

draw_set_font(font_dialogue);
draw_text(base_x + move - 2, base_y + 2, stage_no);

draw_set_font(font_spellcard);
draw_text(base_x + indent + move - 2, base_y + 42, stage_name);

// main text
draw_set_color(splash_color);

draw_set_font(font_dialogue);
draw_text(base_x + move, base_y, stage_no);

draw_set_font(font_spellcard);
draw_text(base_x + indent + move, base_y + 40, stage_name);

// reset
draw_set_alpha(1);