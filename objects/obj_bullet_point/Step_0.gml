var p = global.party_leader_data.shmup_version;
if (!instance_exists(p)) exit;

timer++;

if (timer > 5)
{
    state = "attract";
}

switch (state)
{
    case "idle":
        y += 0.5;

        state = "attract";
    break;

    case "attract":
        var dir = point_direction(x, y, p.x, p.y);

        x += lengthdir_x(attract_speed, dir);
        y += lengthdir_y(attract_speed, dir);
		attract_speed += 0.5;
		attract_speed = min(attract_speed, 12);

        if (point_distance(x, y, p.x, p.y) < 10)
        {
			audio_play_sound(sfx_item_collect, 1, false);
			global.value_bullet_bonus++;
            add_score(value);
            instance_destroy();
        }
    break;
}