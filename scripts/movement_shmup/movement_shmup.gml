function movement_shmup()
{
    if (global.game_over) exit;

    focused = replay_input_down(TSA_IN_FOCUS);

    var spd = focused ? focus_speed : move_speed;

    var mx = replay_input_down(TSA_IN_RIGHT)
           - replay_input_down(TSA_IN_LEFT);

    var my = replay_input_down(TSA_IN_DOWN)
           - replay_input_down(TSA_IN_UP);

    if (mx != 0 && my != 0)
    {
        mx *= 0.7071;
        my *= 0.7071;
    }

    x += mx * spd;
    y += my * spd;

    x = clamp(x, global.play_left, global.play_right);
    y = clamp(y, global.play_top, global.play_bottom);
}