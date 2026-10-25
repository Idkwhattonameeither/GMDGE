if (global.choice_active)
{
    var box_x1 = 600;
    var box_y1 = 320 - 30 * array_length(global.choice_options);
    var box_x2 = 756;
    var box_y2 = 360;

    // border
    draw_set_color(c_white);
    draw_roundrect(box_x1, box_y1, box_x2, box_y2, false);

    // fill
    draw_set_color(c_black);
    draw_roundrect(box_x1+2, box_y1+2, box_x2-2, box_y2-2, false);

    // options
    var base_y = box_y1 + 20;

    for (var i = 0; i < array_length(global.choice_options); i++)
    {
        if (i == global.choice_index)
            draw_set_color(c_yellow);
        else
            draw_set_color(c_white);

        draw_text(box_x1 + 20, base_y + i * 30, global.choice_options[i]);
    }
}