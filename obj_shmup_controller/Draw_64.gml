/// obj_shmup_controller - Draw GUI
if(global.game_over) draw_set_alpha(0);
else draw_set_alpha(1);
var mid_or_final = 0;

var gw = 756;
var gh = 504;
draw_set_font(font_dialogue);

var play_w = 384;
var right_x = play_w;

var boss = instance_find(global.next_enemy, 0);
var p = instance_find(global.party_leader_data.shmup_version, 0);

// --------------------------------------------------
// COLORS
// --------------------------------------------------
var col_green   = make_color_rgb(100,255,120);
var col_border  = make_color_rgb(58,58,68);
var col_panel   = make_color_rgb(26,26,40);
var col_graybar = make_color_rgb(80,80,80);
var col_darkred = make_color_rgb(70,20,20);

// --------------------------------------------------
// LEFT SIDE
// --------------------------------------------------

draw_set_font(font_dialogue);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// --- TIMER ---
if (instance_exists(boss))
{
    var t = boss.spell_active ? boss.spell_time : boss.nonspell_time;
    var sec = string_format(min(99.99, t/60), 2, 2);

    draw_set_halign(fa_right);
    draw_set_color(t <= 600 ? c_red : c_white);
    draw_text(play_w - 12, 15, sec);
}

// --- BOSS NAME ---
draw_set_halign(fa_left);
draw_set_color(col_green);

if(instance_exists(boss)){
draw_text(20, 20, instance_exists(boss) ? boss.boss_name : "");
}

// --- PHASE PIPS ---
if (instance_exists(boss))
{
	if(instance_exists(obj_tim_day_green_enemy_shmup)){
	mid_or_final = (boss.phase_current <= 7) ? boss.phase_current : boss.phase_current - 8;
	}
	else mid_or_final = boss.phase_current;
    draw_set_color(col_green);
    for (var i = 0; i < mid_or_final; i++)
    {
        draw_circle(20 + i * 14, 56, 4, false);
    }
}

// --- BORDER ---
draw_set_color(col_border);
draw_line(play_w, 0, play_w, gh);

// --------------------------------------------------
// RIGHT PANEL
// --------------------------------------------------

var bx1 = right_x + 4;
var bx2 = gw - 4;
var h = 64;
var gap = 8;

var y1 = 28;

draw_panel(play_w, 0, gw, gh);
draw_line(play_w, 0, play_w, 504);

// --- SCORE ---
draw_panel(bx1, y1, bx2, y1 + h);

draw_set_color(c_white);
draw_set_halign(fa_left);
draw_text(bx1 + 12, y1 + 8, lang("HIGH SCORE", "ĐIỂM CAO"));

draw_set_halign(fa_right);
draw_text(bx2 - 12, y1 + 8, string(high_score));

draw_set_halign(fa_left);
draw_text(bx1 + 12, y1 + 34, lang("SCORE", "ĐIỂM"));

draw_set_halign(fa_right);
draw_text(bx2 - 12, y1 + 34, string(real_score));

y1 += h + gap;

// --- GRAZE ---
draw_panel(bx1, y1, bx2, y1 + h);

draw_set_halign(fa_left);
draw_text(bx1 + 12, y1 + 8, lang("GRAZE", "LƯỚT"));

draw_set_halign(fa_right);
draw_text(bx2 - 12, y1 + 8, lang("VALUE", "GIÁ TRỊ"));

draw_set_halign(fa_left);
draw_text(bx1 + 12, y1 + 34, string_format_commas(global.graze));

draw_set_halign(fa_right);
draw_text(bx2 - 12, y1 + 34, string_format_commas(global.value));

y1 += h + gap;

// --- POWER ---
draw_panel(bx1, y1, bx2, y1 + h);

draw_set_halign(fa_left);
draw_set_color(c_white);
draw_text(bx1 + 12, y1 + 8, lang("POWER", "LỰC BẮN"));

draw_set_color(c_yellow);
draw_text(bx1 + 12, y1 + 34,
    string_format(global.party_leader_data.shmup_version.shot_power,1,2) + " / " + string_format(global.party_leader_data.shmup_version.max_power,1,2)
);

y1 += h + gap;

// --- LIVES / BOMBS ---

draw_panel(bx1, y1, bx2, y1 + 80);

if(global.gamemode == 0){
	draw_set_color(c_yellow);
	draw_set_halign(fa_left);
	draw_text(bx1 + 12, y1 + 8, lang("RETRIES", "LẦN THỬ LẠI"));
	draw_text(bx1 + 12, y1 + 36, global.retries);
	draw_set_color(c_white);
}

if(global.gamemode == 1){
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_text(bx1 + 12, y1 + 8, lang("LIVES", "MẠNG"));
var heart_x = bx1 + 12;
var heart_y = y1 + 36;
for (var i = 0; i < global.lives; i++)
{
    draw_sprite(shmup_heart, 0, heart_x + i * 22, heart_y);
}
}

if(global.gamemode == 2){
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_text(bx1 + 12, y1 + 8, lang("DEATHS", "LẦN CHẾT"));
	draw_text(bx1 + 12, y1 + 36, global.deaths);
}

draw_set_halign(fa_right);
draw_text(bx2 - 12, y1 + 8, lang("BOMBS", "KỸ NĂNG"));

// lives (hearts)


var bomb_x = bx2 - 36;
var bomb_y = y1 + 36;

if(global.party_leader_data.shmup_version == obj_moony_day_player_shmup && global.shot_type == 2){
	draw_set_color(make_color_rgb(255, 128, 128));
	draw_text(bx2 - 12, bomb_y, lang("NULLIFIED", "VÔ HIỆU"));
	draw_set_color(c_white);
}
else for (var i = 0; i < global.bombs; i++)
{
    draw_sprite(shmup_bomb, 0, bomb_x - i * 20, bomb_y);
}

draw_set_halign(fa_center);
draw_set_valign(fa_top);

var diff_col = c_white;
switch(global.difficulty)
{
    case 0: diff_col = c_lime; break;
    case 1: diff_col = c_aqua; break;
    case 2: diff_col = c_red; break;
    case 3: diff_col = c_fuchsia; break;
}

draw_set_color(diff_col);
draw_text((bx1 + bx2) * 0.5, 6, lang_arr(global.diff_names)[global.difficulty]);

// reset
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);