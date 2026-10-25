if (global.game_over){
	audio_stop_all();
}

if (file_exists(diff("saveE.sav", "saveN.sav", "saveH.sav", "saveL.sav"))) {
    var f = file_text_open_read(diff("saveE.sav", "saveN.sav", "saveH.sav", "saveL.sav"));
    global.highscore = real(file_text_read_string(f));
    file_text_close(f);
} else {
    global.highscore = 0;
}

function save_highscore() {
    var f = file_text_open_write(diff("saveE.sav", "saveN.sav", "saveH.sav", "saveL.sav"));
    file_text_write_string(f, string(global.highscore));
    file_text_close(f);
}

if (global.score > global.highscore) {
    global.highscore = global.score;
    save_highscore();
}

if(global.victory) audio_group_stop_all(audiogroup_bgm);
var boss = instance_find(global.next_enemy, 0);
if(instance_exists(boss) && boss.nonspell_time <= 600){
	if(boss.nonspell_time mod 60 == 0){
		audio_play_sound(sfx_timeout, 1, false);
	}
}
if(instance_exists(boss) && boss.spell_time <= 600){
	if(boss.spell_time mod 60 == 0){
		audio_play_sound(sfx_timeout, 1, false);
	}
}

high_score = string_format_commas(global.highscore);
real_score = string_format_commas(global.score);
global.value = default_value + (floor(global.graze / 10) + floor(global.value_bullet_bonus / 20)) * 10 + global.value_point_bonus * 10;

if (global.lives < 0 && global.gamemode < 2){
	global.game_over = true;
	instance_create_layer(0, 0, "UI", obj_game_over);
}
else if (global.gamemode == 2) global.lives = 0;
if global.gamemode == 0 clamp(global.lives, global.lives, 0);