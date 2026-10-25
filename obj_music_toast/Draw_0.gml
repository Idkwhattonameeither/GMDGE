draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_set_font(font_spellcard);
if (x == 10){
	timer++;
}
if timer >= 120{
	alpha -= 0.02;
	draw_set_alpha(alpha);
}
draw_text(x, y, "BGM: " + global.bgm);
draw_set_font(font_dialogue);