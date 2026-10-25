
/// obj_moony_day_player_shmup — Step

if (global.game_over) exit;

// This function must also be converted to replay inputs.
movement_shmup();

if (!instance_exists(obj_dialogue))
{
    // Default shot
    if (replay_input_down(TSA_IN_SHOT))
    {
        default_shot_delay--;

        if (default_shot_delay <= 0)
        {
            shoot_default_shmup();
            default_shot_delay = 5;
        }
    }

    // Debug: keep this keyboard-only and disable during playback.
    if (global.replay_mode != "playback"
    && keyboard_check_pressed(ord("P")))
    {
        shot_power++;
    }

    // Shot A
    if (global.shot_type == 0)
    {
        if (!replay_input_down(TSA_IN_SHOT))
        {
            shot_delay = 5;
        }

        if (replay_input_pressed(TSA_IN_BOMB))
        {
            shot_delay = 5;
        }

        if (replay_input_down(TSA_IN_SHOT))
        {
            shot_timer--;
            shot_delay -= 0.002;
            shot_delay = max(shot_delay, 4);

            if (shot_timer <= 0)
            {
                shoot_shmup();
                shot_timer = shot_delay;
            }
        }
        else
        {
            shot_timer = 0;
        }
    }

    // Shot B
    else if (global.shot_type == 1)
    {
        shot_delay = 1;

        if (replay_input_down(TSA_IN_SHOT))
        {
            shot_timer--;

            if (shot_timer <= 0)
            {
                shoot_shmup();
                shot_timer = shot_delay;
            }
        }
    }

    if (invincible)
    {
        invuln_timer--;

        if (invuln_timer <= 0)
        {
            invincible = false;
        }
    }
    else if (global.shot_type == 2)
    {
        // Shot C
        shot_power = max(shot_power, 1);
        max_power = 8;

        if (instance_place(x, y, obj_item_power) != noone)
        {
            shot_power += 0.01;
        }

        shot_delay = 5;

        if (replay_input_down(TSA_IN_SHOT))
        {
            shot_timer--;

            if (shot_timer <= 0)
            {
                shoot_shmup();
                shot_timer = shot_delay;
            }
        }
    }

    if (invincible)
    {
        invuln_timer--;

        if (invuln_timer <= 0)
        {
            invincible = false;
        }
    }

    // This function must also be converted to replay inputs.
    use_bomb();
}
