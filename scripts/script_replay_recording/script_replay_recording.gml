
/// scr_replay_recording

function replay_start_recording(_practice, _start_stage)
{
    global.replay_mode = "record";

    // Choose and set ONE seed for the entire run.
    global.replay_seed = irandom(2147483647);
    random_set_seed(global.replay_seed, true);

    global.replay_inputs = [];
    global.replay_rng = []; // Kept temporarily for compatibility.
    global.replay_frame = 0;

    global.replay_input_mask = 0;
    global.replay_previous_input_mask = 0;

    global.replay_practice = _practice;
    global.replay_start_stage = _start_stage;
}


function replay_pad2(_number)
{
    return (_number < 10 ? "0" : "")
        + string(_number);
}


function replay_save_recording(_score)
{
	if (global.replay_invalidated)
    return "";
    if (global.replay_mode != "record")
        return "";

    var dt = date_current_datetime();

    var stamp =
        string(date_get_year(dt))
        + replay_pad2(date_get_month(dt))
        + replay_pad2(date_get_day(dt))
        + "_"
        + replay_pad2(date_get_hour(dt))
        + replay_pad2(date_get_minute(dt))
        + replay_pad2(date_get_second(dt));

    var data = {
        version: 1,
        seed: global.replay_seed,
        inputs: global.replay_inputs,
        rng: global.replay_rng,

        score: _score,
        difficulty: global.difficulty,
        shot: global.shot_type,
        gamemode: global.gamemode,

        practice: global.replay_practice,
        start_stage: global.replay_start_stage
    };

    var filename = "tsa_replay_" + stamp + ".json";
    var suffix = 1;

    while (file_exists(filename))
    {
        filename = "tsa_replay_" + stamp
            + "_" + string(suffix) + ".json";
        suffix++;
    }

    var file = file_text_open_write(filename);

    if (file < 0)
    {
        show_debug_message("Could not save replay.");
        return "";
    }

    file_text_write_string(file, json_stringify(data));
    file_text_close(file);

    global.replay_mode = "off";

    show_debug_message("Replay saved: " + filename);

    return filename;
}
