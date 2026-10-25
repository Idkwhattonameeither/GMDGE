draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(font_spellcard);
draw_set_color(c_white);
if(max_score) draw_set_color(c_yellow);

draw_set_alpha(alpha);
draw_text(x, y, string_format_commas(amount));
draw_set_alpha(1);
draw_set_font(font_dialogue);
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_set_color(c_white);