var p = instance_find(global.party_leader_data.shmup_version, 0);
if (!instance_exists(p)) exit;

switch (state)
{
    case "fall":
		x += 0;
		y += speed;
		direction = 270;

        if (point_distance(x, y, p.x, p.y) < 80)
        {
            state = "attract";
        }
    break;

    case "attract":
        var dir = point_direction(x, y, p.x, p.y);

        x += lengthdir_x(6, dir);
        y += lengthdir_y(6, dir);
    break;
}

if (point_distance(x, y, p.x, p.y) < 10)
{
    global.bombs += 1;
    global.bombs = min(global.bombs, global.max_bombs);
	audio_play_sound(sfx_item_collect, 1, false);
	audio_play_sound(sfx_bomb_extend, 100, false);
    instance_destroy();
}

var poc_y = global.play_top + 168;

if (p.y < poc_y)
{
    state = "attract";
}

