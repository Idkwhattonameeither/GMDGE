var boss = instance_find(global.next_enemy, 0);

if (instance_exists(boss) && boss.spell_active) {
    // 1. Draw Spell Name
    draw_set_font(font_spellcard);
    draw_set_color(c_white);
    draw_text(x, 504 - 29, boss.spell_name);
    
    // 2. Draw Bonus Label & Value
    draw_text(x, 504 - 18, "Bonus");
    draw_text(x + 50, 504 - 18, boss.bonus_spell());
    
    // 3. Draw Spell History (Fixed syntax & integrated Vietnamese lang wrapper)
    var history_label = lang("History   ", "Lịch sử   ");
    draw_text(x, 504 - 7, history_label + history_str);
}