move_speed = 4;
focus_speed = 1.3;

hitbox_radius = 2;
invincible = false;
invuln_timer = 0;

focused = false;

shot_power = 0; // range: 0 --> 5.00

shot_timer = 0;
default_shot_delay = 5;
shot_delay = 5; // lower = faster firing
max_power = 5;

unfocused_type = [obj_moony_player_ushot_A, obj_moony_player_shot_B, obj_moony_player_shot_C];
focused_type = [obj_moony_player_fshot_A, obj_moony_player_shot_B, obj_moony_player_shot_C];
bomb_type = [obj_bomb_effect_moony_A, obj_bomb_effect_moony_B, obj_bomb_effect_moony_C];
default_type = obj_moony_default_bullet;

prev = false;