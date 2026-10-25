var boss = instance_find(obj_boss, 0);
if(hp != 0){
if(!instance_exists(boss)) instance_destroy();
else if (!boss.spell_active) hp = 0;
}
switch (state)
{
	case "move":
	{
	}
	break;
	
    case "attack_tim_sc3":
    {
        shot_timer--;
		attack_delay = 20;

        if (shot_timer <= 0)
        {
			spawn_bullet(x, y, diff(2, 2.4, 2.75, 3), 90, "card", c_yellow, "reflect_tim_sc3");
			spawn_bullet(x, y, diff(2, 2.4, 2.75, 3), 270, "card", c_yellow, "reflect_tim_sc3");
            shot_timer = attack_delay;
        }
    }
    break;
	
	case "shoot_flower":
	timer++;
	attack_delay--;
	if (attack_delay <= 0){
		shot_timer--;
	}
	if (shot_timer <= 0){
		for(var i = 0; i < diff(3, 4, 5, 6); i++){
			spawn_bullet(x, y, diff(1.5, 1.8, 2.1, 2.25), direction + i * 360 / diff(3, 4, 5, 6), "card", c_yellow, "attack");
		}
		shot_timer = 20;
		times--;
		if(times <= 0) state = "move";
	}
	break;
	
    case "spiral":
        radius += expand_speed;
        angle += rotation_speed;

        if (radius >= max_radius) {
            radius = max_radius;
            state = "circle";
        }
		
		x = boss.x + lengthdir_x(radius, angle);
		y = boss.y + lengthdir_y(radius, angle);
        break;

    case "circle":
        angle += rotation_speed;

		x = boss.x + lengthdir_x(radius, angle);
		y = boss.y + lengthdir_y(radius, angle);
		shot_timer--;
		if(shot_timer <= 0){
			for(var i = 0; i <= diff(4, 5, 7, 8); i++){
				spawn_bullet(x, y, diff(1.75, 2.25, 2.5, 2.6), angle + i * 360 / diff(4, 5, 7, 8), "card", make_colour_rgb(255, 170, 51), "attack");
			}
			shot_timer = 20;
		}
		break;
		
	case "flip_spin_direction":
		rotation_speed = rotation_speed * -1;
		state = "circle";
		break;
		
	case "bounce_explode":
		if(x <= 0 || x >= 368 || y <= 0){
			var rangle = random(360);
			for(var i = 0; i < diff(8, 12, 14, 16); i++){
				var b = spawn_bullet(x, y, diff(1.6, 1.8, 1.9, 2), angle + i * 360 / diff(8, 12, 14, 16), "card", bullet_red, "attack");
				b.gravity = 0.005;
				b.gravity_direction = 270;
			}
			instance_destroy();
		}
	break;
	
	case "wind_left":
		timer--;
		if(timer <= 0) instance_destroy();
		speed = 2.5;
		if(y <= 0) direction = 270;
		if(y >= 350) direction = 90;
		shot_timer--;
		if (shot_timer <= 0){
			var b = spawn_bullet(x, y, diff(1.5, 1.75, 1.875, 2), random_range(-90, 90), "rice", c_aqua, "attack");
			shot_timer = diff(10, 8, 7, 5);
		}
		break;
		
	case "wind_right":
		timer--;
		if(timer <= 0) instance_destroy();
		speed = 2.5;
		if(y <= 0) direction = 270;
		if(y >= 350) direction = 90;
		shot_timer--;
		if (shot_timer <= 0){
			var b = spawn_bullet(x, y, diff(1.5, 1.75, 1.875, 2), random_range(90, 270), "rice", c_lime, "attack");
			shot_timer = diff(10, 8, 7, 5);
		}
		break;
		
	case "move_sarah_pre_spell":
		direction = point_direction(x, y, target_x, target_y);
		speed = 3;
		if abs(target_x - x) <= 10 && abs(target_y - y) <= 10 state = "big_laser";
	break;
		
	case "big_laser":
		timer--;
		if(timer <= 0 && !laser_spawned){
			spawn_infinite_laser(x, y, 6, 270, 0, 30, 60, make_colour_rgb(196, 255, 64));
			laser_spawned = true;
			timer = diff(120, 115, 110, 105);
		}
		if (timer <= 0 && laser_spawned = true){
			target_x = final_x;
			target_y = final_y;
			state = "move_sarah_post_spell";
		}
		break;
	
	case "move_sarah_post_spell":
		direction = point_direction(x, y, target_x, target_y);
		speed = 3;
		if abs(target_x - x) <= 10 && abs(target_y - y) <= 10 instance_destroy();
	break;
	
	case "blue":
	var p = instance_find(global.party_leader_data.shmup_version, 0);
	timer--;
	if timer <= 0{
		for(var i = diff(-1, -2, -3, -4); i <= diff(1, 2, 3, 4); i++){
			spawn_bullet(x, y, diff(2, 2.2, 2.35, 2.5), i * 10 + point_direction(x, y, p.x, p.y), "rice", c_aqua, "attack");
		}
		if (global.difficulty >= 2){
			for(var i = diff(-1, -2, -3, -4); i <= diff(1, 2, 3, 4); i++){
			spawn_bullet(x, y, diff(2.4, 2.6, 2.75, 2.9), i * 10 + point_direction(x, y, p.x, p.y), "rice", c_aqua, "attack");
			}
		}
		timer = diff(60, 50, 45, 40);
	}
	break;
	
	case "yellow":
	timer--;
	if timer <= 0{
	var count = irandom_range(5, 10);
	for (var i = 0; i < count; i++){
		spawn_bullet(x, y, diff(2, 2.2, 2.3, 2.5), random(360), "rice", c_yellow, "attack");
	}
	timer = 15;
	}
	break;
	
	case "red":
	timer--;
	if timer <= 0{
		var rang = random(360);
		for(var r = 0; r < diff(1, 2, 3, 4); r++){
			for(var i = 0; i < 8; i++){
				spawn_bullet(x, y, 2 + r * 0.1, rang + i * 360 / 8 + r, "rice", bullet_red, "attack");
			}
			for(var i = 0; i < 8; i++){
				spawn_bullet(x, y, 2.5 + r * 0.1, rang + i * 360 / 8 + r, "rice", bullet_red, "attack");
			}
		}
		timer = 45;
	}
	break;
	
	case "green":
	timer--;
	if timer <= 0{
	var count = irandom_range(5, 10);
	for (var i = 0; i < count; i++){
		var b = spawn_bullet(x, y, diff(2, 2.2, 2.3, 2.5), random(360), "rice", c_lime, "spin");
		var rot = random_range(-1.5, -1);
		var time = 10;
		b.rot_speed = rot;
		b.spin_timer = time;
	}
	timer = 30;
	}
	break;
	
	case "gray":
	var p = instance_find(global.party_leader_data.shmup_version, 0);
	timer--;
	if timer <= 0{
	for(var i = 0; i < diff(10, 15, 20, 25); i++){
		spawn_bullet(x + lengthdir_x(150, i * 360 / diff(10, 15, 20, 25)), y + lengthdir_y(150, i * 360 / diff(10, 15, 20, 25)), 2, point_direction(x, y, p.x, p.y), "rice", c_white, "attack");
	}
	timer = diff(60, 55, 50, 45);
	}
	break;
	
	case "laser_sunny_sc2":
	spawn_infinite_laser(x, y, 24, dir, 0, 0, 1, c_aqua);
	break;
}


if(hp <= 0){
	drop_points(5);
	drop_power(0.14);
	instance_destroy();
}

if (x < -64 || x > 448 || y < -64 || y > 600)
{
    instance_destroy();
}