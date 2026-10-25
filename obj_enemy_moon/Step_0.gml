var p = instance_find(global.party_leader_data.shmup_version, 0);
var boss = instance_find(obj_boss, 0);
if !instance_exists(boss) instance_destroy();
dist = point_distance(x, y, p.x, p.y);

switch state{
	case "attack":
	break;
	
	case "smash":
	if (x <= 0 || x >= 384 || y <= 0 || y >= 504){
		speed = 0;
		audio_play_sound(sfx_moon_crash, 2, false);
		state = next_state;
	}
	break;
	
	case "bullets_after_smash":
	var rand = random(360);
	for(var i = 0; i < diff(10, 13, 15, 20); i++){
		if global.difficulty >= 1{
		var b1 = spawn_bullet(x, y, 0, rand + i * 360 / diff(10, 13, 15, 20), "small_circle", c_fuchsia, "timed_accel");
		b1.countdown = diff(60, 55, 50, 45);
		b1.accel = diff(0.05, 0.06, 0.075, 0.1);
		b1.cap = diff(1.4, 1.6, 1.75, 1.8);
		}
		if global.difficulty >= 2{
		var b2 = spawn_bullet(x, y, 0, rand + i * 360 / diff(10, 13, 15, 20), "small_circle", c_fuchsia, "timed_accel");
		b2.countdown = diff(55, 50, 45, 40);
		b2.accel = diff(0.06, 0.07, 0.08, 0.11);
		b2.cap = diff(1.5, 1.7, 1.8, 2);
		}
	}
	for (var i = 0; i < diff(10, 20, 30, 40); i++){
		var b = spawn_bullet(i * 384 / diff(10, 20, 30, 40), 0, 0, 270, "small_circle", c_aqua, "timed_accel");
		b.countdown = random_range(60, 50);
		b.accel = random_range(diff(0.03, 0.04, 0.05, 0.06), diff(0.06, 0.07, 0.08, 0.1));
		b.cap = random_range(diff(1.2, 1.3, 1.4, 1.5), diff(1.7, 1.8, 1.9, 2));
	}
	speed = 1;
	direction = 270;
	state = "attack";
	break;
	
	case "bullets_after_smash_aim":
	var rando = random(360);
	for(var i = 0; i < diff(10, 13, 15, 20); i++){
		if global.difficulty >= 1{
		var b1 = spawn_bullet(x, y, 0, rando + i * 360 / diff(10, 13, 15, 20), "small_circle", c_fuchsia, "timed_accel");
		b1.countdown = diff(60, 55, 50, 45);
		b1.accel = diff(0.05, 0.06, 0.075, 0.1);
		b1.cap = diff(1.4, 1.6, 1.75, 1.8);
		}
		if global.difficulty >= 2{
		var b2 = spawn_bullet(x, y, 0, rando + i * 360 / diff(10, 13, 15, 20), "small_circle", c_fuchsia, "timed_accel");
		b2.countdown = diff(55, 50, 45, 40);
		b2.accel = diff(0.06, 0.07, 0.08, 0.11);
		b2.cap = diff(1.5, 1.7, 1.8, 2);
		}
	}
	for (var i = 0; i < diff(10, 20, 30, 40); i++){
		var b = spawn_bullet(i * 384 / diff(10, 20, 30, 40), 0, 0, 270, "small_circle", c_aqua, "timed_accel");
		b.countdown = random_range(60, 50);
		b.accel = random_range(diff(0.03, 0.04, 0.05, 0.06), diff(0.06, 0.07, 0.08, 0.1));
		b.cap = random_range(diff(1.2, 1.3, 1.4, 1.5), diff(1.7, 1.8, 1.9, 2));
	}
	direction = point_direction(x, y, p.x, p.y);
	state = "wait";
	if (times <= 0) state = "attack";
	speed = 3;
	times--;
	break;
	
	case "wait":
	speed = 0;
	timer--;
	if (timer <= 0){
		timer = 30;
		state = "smash";
		speed = 3;
	}
	break;
}

hitbox_radius = 56;
if (dist < hitbox_radius + p.hitbox_radius)
	{
		if (!p.invincible)
		{
        player_hit();
		}
	}
	
if (x <= -100 || x >= 484 || y <= -100 || y >= 604) instance_destroy();