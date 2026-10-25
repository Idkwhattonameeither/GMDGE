function draw_panel(x1, y1, x2, y2)
{
    draw_set_color(make_color_rgb(20,20,30));
    draw_rectangle(x1, y1, x2, y2, false);

    draw_set_color(c_dkgray);
    draw_rectangle(x1, y1, x2, y2, true);
	draw_set_color(c_white);
}