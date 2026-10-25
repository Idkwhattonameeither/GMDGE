display_set_gui_size(756, 504);
view_enabled = true;

view_camera[0] = camera_create_view(0, 0, 756, 504, 0, -1, -1, -1, -1);
view_visible[0] = true;

global.play_left   = 0;
global.play_right  = 384;
global.play_top    = 0;
global.play_bottom = 504;

global.score = 0;
global.highscore = 0;

global.graze = 0;
default_value = diff(10000, 12500, 15000, 20000);
global.value = 0;
global.value_point_bonus = 0;
global.value_bullet_bonus = 0;

if (global.gamemode == 0){
	global.lives = 0;
}
else global.lives = 5;
global.max_lives = 8;

global.max_bombs = 8;
global.bombs = 3;

x = clamp(x, global.play_left, global.play_right);
y = clamp(y, global.play_top, global.play_bottom);

instance_create_depth(200, 400, 99, global.party_leader_data.shmup_version);
if global.practice_stage >= 2{
				with (global.party_leader_data.shmup_version){
				shot_power = max_power;
				}
				}

instance_create_layer(800, 14, layer_get_id("Instances"), obj_music_toast);

var s = instance_create_layer(0, 0, layer_get_id("Instances"), obj_stage_splash);
s.splash_color = global.splash_color;
s.stage_no = global.stage_number;
s.stage_name = global.stage_name;

instance_create_layer(0, 0, layer_get_id("UI"), obj_spellcard_announce);

global.victory = false;

global.bomb_damage = 150;
global.game_over = false;
alpha = 1;

playfield_x = 0;       // Distance from left edge of screen to playfield left
playfield_y = 0;       // Distance from top edge of screen to playfield top
playfield_w = 384;      // Width of the playable arena
playfield_h = 504;      // Height of the playable arena