
/// obj_game_over — Step

if (!global.game_over) exit;

// Is a continue available?
var can_continue =
    (global.gamemode == 1)
    && (global.continues_used < global.max_continues);

if (keyboard_check_pressed(vk_left)
|| keyboard_check_pressed(vk_right))
{
    menu_index = 1 - menu_index;

    // Don't select Retry if it isn't available.
    if (!can_continue)
        menu_index = 1;
}

if (keyboard_check_pressed(ord("Z")))
{
    if (menu_index == 0 && can_continue)
    {
        restart_battle();
    }
    else
    {
        game_end();
    }
}

function restart_battle()
{
	global.replay_mode = "off";
	global.replay_inputs = [];
	global.replay_rng = [];
	global.replay_frame = 0;
	global.replay_invalidated = true;
	if (global.gamemode == 0)
	{
    // Deathless: restart the entire run from Stage 1.
    global.run_stage_reached = 1;
    global.next_enemy = obj_john_midboss_shmup;
    global.stage_controller = obj_stage_1_controller;
    global.theme = stage1_theme;
    global.splash_color = c_lime;
    global.stage_number = "STAGE 1";
    global.stage_name = "The Artist";
	global.replay_invalidated = false;
	}
    // Count the continue before restarting.
    global.continues_used++;

    audio_stop_all();

    global.game_over = false;
    global.bomb_damage = 200;

    // Restore the player's resources.
    global.lives = 5;
    global.bombs = 3;

    global.value = diff(10000, 12500, 15000, 20000);
    global.score = 0;
    global.graze = 0;
    global.power = 0;
    global.value_point_bonus = 0;
    global.value_bullet_bonus = 0;
    global.retries++;

    // Restore player position.
    with (global.party_leader_data.shmup_version)
    {
		shot_power = max_power;
        x = 200;
        y = 400;
    }

    // Clear the active battle.
    with (obj_enemy) instance_destroy();
    with (obj_items) instance_destroy();
    with (obj_enemy_invisible) instance_destroy();
    with (obj_bullet) instance_destroy();
	with (global.stage_controller) instance_destroy();

    // Restart the current stage's controller.
    // Recreate only the current stage's controller.
	if (global.stage_controller != noone)
	{
		instance_create_layer(
			0, 0,
			"Instances",
			global.stage_controller
		);
	}

    audio_play_sound(global.theme, 1, true);

    instance_create_layer(
        0, 0, layer_get_id("UI"), obj_stage_splash
    );

    with (obj_music_toast)
    {
        x = 500;
        alpha = 1;
        timer = 0;
    }

    with (obj_game_over) instance_destroy();
}