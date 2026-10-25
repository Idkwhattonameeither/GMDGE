draw_set_alpha(1);
if (focused)
{
	draw_set_color(make_color_rgb(196, 64, 64));
	draw_circle(x, y, hitbox_radius * 3 / 2, false);
    draw_set_color(c_white);
    draw_circle(x, y, hitbox_radius, false);
}