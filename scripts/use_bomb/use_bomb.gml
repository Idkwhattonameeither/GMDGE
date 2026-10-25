function use_bomb()
{
    var p = global.party_leader_data.shmup_version;

    // Bomb activates only on the initial press.
    if (replay_input_pressed(TSA_IN_BOMB))
    {
        if (p == obj_moony_day_player_shmup
        && global.shot_type == 2)
        {
            // Shot C uses Power as its bomb resource.
            if (p.shot_power <= 1.99)
                return;

            bomb_effect = p.bomb_type[2];
            audio_play_sound(sfx_player_bomb, 1, false);

            p.shot_power -= 1;
        }
        else
        {
            // Other shot types use the bomb stock.
            if (global.bombs <= 0)
                return;

            bomb_effect =
                global.party_leader_data.shmup_version
                    .bomb_type[global.shot_type];

            audio_play_sound(sfx_player_bomb, 1, false);

            global.bombs -= 1;
        }

        invincible = true;
        invuln_timer = 240;

        instance_create_layer(
            x, y, "Effects", bomb_effect
        );

        var boss = instance_find(global.next_enemy, 0);

        if (boss != noone && boss.spell_active)
        {
            boss.spell_captured = false;
            boss.spell_failed = true;
        }
    }
}