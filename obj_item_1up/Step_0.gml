if(global.gamemode == 0){
	drop_bomb(1);
	instance_destroy();
}

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
	if(global.gamemode == 2){
		global.deaths--;
		audio_play_sound(sfx_extend, 1, false);
		instance_destroy();
	}
	else if global.gamemode == 1{
    global.lives += 1;
    global.lives = min(global.lives, global.max_lives);
	audio_play_sound(sfx_extend, 1, false);
    instance_destroy();
	}
}

var poc_y = global.play_top + 168;

if (p.y < poc_y)
{
    state = "attract";
}

