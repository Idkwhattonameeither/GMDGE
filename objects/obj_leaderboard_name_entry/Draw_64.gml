var gw = display_get_gui_width();
var gh = display_get_gui_height();

draw_set_alpha(1);
draw_set_color(make_color_rgb(5, 8, 28));
draw_rectangle(0, 0, gw, gh, false);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_font(font_dialogue);
draw_set_color(c_white);

draw_text(gw * 0.5, gh * 0.25, "NEW HIGH SCORE!");

draw_set_font(font_spellcard);
draw_text(
    gw * 0.5, gh * 0.40,
    "SCORE: " + string(global.lb_pending_score)
);

draw_set_font(font_dialogue);
draw_text(gw * 0.5, gh * 0.55, "ENTER YOUR NAME");

draw_set_color(make_color_rgb(130, 225, 255));
draw_text(
    gw * 0.5, gh * 0.65,
    keyboard_string + "_"
);

draw_set_font(font_spellcard);
draw_set_color(c_white);
draw_text(gw * 0.5, gh * 0.80, "MAXIMUM 8 CHARACTERS");

draw_set_halign(fa_left);
draw_set_valign(fa_top);