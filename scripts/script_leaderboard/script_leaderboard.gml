
/// scr_leaderboard

function leaderboard_init()
{
    global.lb_file = "tsa_leaderboard.json";
    global.lb_limit = 10;

    global.lb_normal = [];
    global.lb_practice = [];

    global.lb_pending_score = 0;
    global.lb_pending_practice = false;
    global.lb_pending_difficulty = 0;
    global.lb_pending_shot = 0;
    global.lb_pending_valid = false;

    leaderboard_load();
}


function leaderboard_load()
{
    global.lb_normal = [];
    global.lb_practice = [];

    if (!file_exists(global.lb_file))
        return;

    var file = file_text_open_read(global.lb_file);
    var contents = "";

    while (!file_text_eof(file))
        contents += file_text_read_string(file);

    file_text_close(file);

    if (string_length(contents) <= 0)
        return;

    var data = undefined;

    try
    {
        data = json_parse(contents);
    }
    catch (e)
    {
        show_debug_message("Leaderboard file could not be parsed.");
        return;
    }

    if (is_struct(data))
    {
        if (variable_struct_exists(data, "normal"))
            global.lb_normal = data.normal;

        if (variable_struct_exists(data, "practice"))
            global.lb_practice = data.practice;
    }
}


function leaderboard_save()
{
    var data = {
        normal: global.lb_normal,
        practice: global.lb_practice
    };

    var file = file_text_open_write(global.lb_file);
    file_text_write_string(file, json_stringify(data));
    file_text_close(file);
}


function leaderboard_get_list(_practice)
{
    if (_practice)
        return global.lb_practice;

    return global.lb_normal;
}


function leaderboard_qualifies(_score, _practice)
{
    var records = leaderboard_get_list(_practice);

    if (array_length(records) < global.lb_limit)
        return true;

    var lowest = records[array_length(records) - 1];

    return _score > lowest.score;
}


// Called ONCE when a run ends.
function leaderboard_begin_entry(_score, _practice)
{
    var records = leaderboard_get_filtered(
        _practice,
        global.difficulty,
        global.shot_type
    );

    if (array_length(records) >= global.lb_limit)
    {
        if (_score <= records[array_length(records) - 1].score)
            return false;
    }

    global.lb_pending_score = _score;
    global.lb_pending_practice = _practice;
    global.lb_pending_difficulty = global.difficulty;
    global.lb_pending_shot = global.shot_type;
    global.lb_pending_gamemode = global.gamemode;
    global.lb_pending_stage = global.run_stage_reached;
    global.lb_pending_cleared = global.run_cleared;
    global.lb_pending_valid = true;

    return true;
}


function leaderboard_get_filtered(_practice, _difficulty, _shot)
{
    var source = leaderboard_get_list(_practice);
    var result = [];

    for (var i = 0; i < array_length(source); i++)
    {
        var e = source[i];

        // Older entries may not contain these fields.
        var d = variable_struct_exists(e, "difficulty")
            ? e.difficulty : 0;
        var s = variable_struct_exists(e, "shot")
            ? e.shot : 0;

        if (d == _difficulty && s == _shot)
            array_push(result, e);
    }

    return result;
}

function leaderboard_add_entry(_name)
{
    if (!global.lb_pending_valid)
        return;

    var clean_name = string_trim(_name);

    if (string_length(clean_name) <= 0)
        clean_name = "PLAYER";

    // Limit displayed name length.
    clean_name = string_copy(clean_name, 1, 8);

    var entry = {
		name: clean_name,
		score: global.lb_pending_score,
		difficulty: global.lb_pending_difficulty,
		shot: global.lb_pending_shot,
		gamemode: global.lb_pending_gamemode,
		practice: global.lb_pending_practice,
		stage_reached: global.lb_pending_stage,
		cleared: global.lb_pending_cleared
	};

    var records = leaderboard_get_list(global.lb_pending_practice);

    // Insert in descending score order.
    var new_records = [];
    var inserted = false;

    for (var i = 0; i < array_length(records); i++)
    {
        if (!inserted && entry.score > records[i].score)
        {
            array_push(new_records, entry);
            inserted = true;
        }

        array_push(new_records, records[i]);
    }

    if (!inserted)
        array_push(new_records, entry);

    // Keep only the top 10.
    while (array_length(new_records) > global.lb_limit)
        array_delete(new_records, array_length(new_records) - 1, 1);

    if (global.lb_pending_practice)
        global.lb_practice = new_records;
    else
        global.lb_normal = new_records;

    leaderboard_save();

    global.lb_pending_valid = false;
}