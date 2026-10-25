function player_hit()
{
	global.deaths++;
	audio_play_sound(sfx_player_hit, 1, false);
	var player = global.party_leader_data.shmup_version;
    global.lives -= 1;

    global.bombs = 3;

    player.invincible = true;
	player.invuln_timer = 240;
	player.shot_delay = player.default_shot_delay;
	
	with (obj_bullet)
	{
		instance_destroy();
	}
	
	var boss = instance_find(global.next_enemy, 0);

	if (boss != noone && boss.spell_active)
	{
		boss.spell_captured = false;
		boss.spell_failed = true;
	}

	player.shot_power -= 0.50;
	player.shot_power = max(player.shot_power, 0);
}