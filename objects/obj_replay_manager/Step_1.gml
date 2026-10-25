
/// obj_replay_manager — Begin Step

// Remember the preceding frame's input.
global.replay_previous_input_mask = global.replay_input_mask;

// PLAYBACK
if (global.replay_mode == "playback")
{
    if (global.replay_frame >= array_length(global.replay_inputs))
    {
        global.replay_input_mask = 0;
        global.replay_mode = "playback_finished";

        show_debug_message("Replay finished.");

        room_goto(room_leaderboard);
        exit;
    }

    // Apply the recorded input for this frame.
    global.replay_input_mask =
        global.replay_inputs[global.replay_frame];

    global.replay_frame++;
}
else
{
    // LIVE KEYBOARD INPUT
    var mask = 0;

    if (keyboard_check(vk_left))  mask |= TSA_IN_LEFT;
    if (keyboard_check(vk_right)) mask |= TSA_IN_RIGHT;
    if (keyboard_check(vk_up))    mask |= TSA_IN_UP;
    if (keyboard_check(vk_down))  mask |= TSA_IN_DOWN;
    if (keyboard_check(ord("Z"))) mask |= TSA_IN_SHOT;
    if (keyboard_check(ord("X"))) mask |= TSA_IN_BOMB;
    if (keyboard_check(vk_shift)) mask |= TSA_IN_FOCUS;

    global.replay_input_mask = mask;

    // Record inputs only. The RNG is not recorded per frame.
    if (global.replay_mode == "record")
    {
        array_push(global.replay_inputs, mask);
    }
}
