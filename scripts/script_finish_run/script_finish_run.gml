function finish_run()
{
	audio_stop_all();
    // Replays must not submit leaderboard entries.
    if (global.replay_mode == "playback"
    || global.replay_mode == "playback_finished")
    {
        return;
    }

    if (global.run_completed)
        return;

    global.run_completed = true;
    global.in_battle = false;

    // Replace global.score if your actual total-score
    // variable uses a different name.
    var final_score = global.score;
	var replay_filename = replay_save_recording(final_score);

    var qualifies = leaderboard_begin_entry(
        final_score,
        global.practice_mode
    );

    if (qualifies)
    {
        keyboard_string = "";
        room_goto(room_name_entry);
    }
    else
    {
        room_goto(room_leaderboard);
    }
}
