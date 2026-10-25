
/// scr_replay_input

function replay_input_down(_action)
{
    return (global.replay_input_mask & _action) != 0;
}

function replay_input_pressed(_action)
{
    return
        (global.replay_input_mask & _action) != 0
        &&
        (global.replay_previous_input_mask & _action) == 0;
}

function replay_input_released(_action)
{
    return
        (global.replay_input_mask & _action) == 0
        &&
        (global.replay_previous_input_mask & _action) != 0;
}