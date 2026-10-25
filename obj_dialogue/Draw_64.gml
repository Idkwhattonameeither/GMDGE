if (!is_active) exit;

var line_data = dialogue_list[current_line];
var portrait = variable_struct_exists(line_data, "portrait") ? line_data.portrait : noone;

// 1. Draw Textbox Background (Classic Touhou / Retro Style)
draw_set_font(font_spellcard);
draw_set_color(c_black);
draw_set_alpha(0.85);
draw_rectangle(box_x, box_y, box_x + box_w, box_y + box_h, false);

draw_set_color(c_white);
draw_set_alpha(1.0);
draw_rectangle(box_x, box_y, box_x + box_w, box_y + box_h, true); // Border

// 2. Handle Optional Portrait Offset
var text_offset_x = 12;

if (portrait != noone && sprite_exists(portrait)) {
    // Draw portrait on the left side inside the box
    draw_sprite(portrait, 0, box_x + 8, box_y + 8);
    text_offset_x = 80; // Shift text right to make room for portrait
}

// 3. Draw Speaker Name Header Box
draw_set_color(c_black);
draw_rectangle(box_x + 8, box_y - 22, box_x + 120, box_y, false);
draw_set_color(c_white);
draw_rectangle(box_x + 8, box_y - 22, box_x + 120, box_y, true);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(box_x + 14, box_y - 18, line_data.speaker);

// 4. Draw Typewriter Text
var visible_text = string_copy(line_data.text, 1, floor(char_index));
draw_text_ext(box_x + text_offset_x, box_y + 12, visible_text, 18, box_w - text_offset_x - 10);
draw_set_font(font_dialogue);