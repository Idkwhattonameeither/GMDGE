
/// scr_replay_browser

function replay_refresh_list()
{
    global.replay_files = [];

    var filename = file_find_first(
        "tsa_replay_*.json",
        fa_none
    );

    while (filename != "")
    {
        array_push(global.replay_files, filename);
        filename = file_find_next();
    }

    file_find_close();
}


// Load a replay and launch it.
function replay_play_file(_filename)
{
    var f = file_text_open_read(_filename);

    if (f < 0)
    {
        show_debug_message("Could not open replay: " + _filename);
        return false;
    }

    // Each replay is written as one JSON line.
    var contents = file_text_readln(f);
    file_text_close(f);

    var data;

    try
    {
        data = json_parse(contents);
    }
    catch (e)
    {
        show_debug_message("Invalid replay file: " + _filename);
        return false;
    }

    if (!is_struct(data)
    || !variable_struct_exists(data, "inputs")
    || !variable_struct_exists(data, "rng")
    || !variable_struct_exists(data, "difficulty")
    || !variable_struct_exists(data, "shot")
    || !variable_struct_exists(data, "practice")
    || !variable_struct_exists(data, "start_stage"))
    {
        show_debug_message("Replay is missing required data.");
        return false;
    }

    // Restore recorded settings and frame data.
	global.deaths = 0;
    global.difficulty = data.difficulty;
    global.shot_type = data.shot;
    global.gamemode = data.gamemode;

    global.replay_seed = data.seed;
    global.replay_inputs = data.inputs;
    global.replay_rng = data.rng;
    global.replay_frame = 0;

    global.replay_input_mask = 0;
    global.replay_previous_input_mask = 0;
    global.replay_mode = "playback";

    global.practice_mode = data.practice;
    global.practice_stage = data.start_stage;

    global.run_completed = false;
    global.in_battle = true;
    global.in_transition = true;

    global.party_leader_data = {
        shmup_version: obj_moony_day_player_shmup
    };

    if (data.practice)
    {
        // The indices must match your six practice stages.
        var controllers = [
            obj_stage_1_controller,
            obj_stage_2_controller,
            obj_stage_3_controller,
            obj_stage_4_controller,
            obj_stage_5_controller,
            obj_stage_6_controller
        ];

        var bosses = [
            obj_john_midboss_shmup,
            obj_louise_midboss_shmup,
            obj_sarah_midboss_shmup,
            obj_sunny_midboss_shmup,
            obj_ricky_midboss_shmup,
            obj_tim_day_green_enemy_shmup
        ];

        var themes = [
            stage1_theme, stage2_theme, stage3_theme,
            stage4_theme, stage5_theme, stage6_theme
        ];

        var colors = [
            c_lime, c_orange, c_fuchsia,
            c_white, bullet_green, c_aqua
        ];

        var names = [
            "The Artist", "The Poet", "The Engineer",
            "The Ally", "The Daredevil", "The Architect"
        ];

        var stage = clamp(data.start_stage, 0, 5);
		if global.practice_stage >= 2{
				with (obj_moony_day_player_shmup){
				shot_power = max_power;
				}
				}
        global.stage_controller = controllers[stage];
        global.next_enemy = bosses[stage];
        global.theme = themes[stage];
        global.splash_color = colors[stage];
        global.stage_number = "STAGE " + string(stage + 1);
        global.stage_name = names[stage];
    }
    else
    {
        // Full-game run starts from Stage 1.
        global.stage_controller = obj_full_stage_controller;
        global.next_enemy = obj_john_midboss_shmup;
        global.theme = stage1_theme;
        global.splash_color = c_lime;
        global.stage_number = "STAGE 1";
        global.stage_name = "The Artist";
    }
	with obj_stage_controllers{
		create();
	}
	global.replay_seed = data.seed;
	random_set_seed(global.replay_seed, true);

    audio_stop_sound(title);
    room_goto(room_shmup);

    return true;
}
