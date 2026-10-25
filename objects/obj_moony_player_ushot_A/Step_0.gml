target = instance_nearest(x, y, obj_enemy);

aim_timer--;
if(aim_timer <= 0){
if (instance_exists(target))
{
    var target_dir = point_direction(x, y, target.x, target.y);

    var diff = angle_difference(target_dir, direction);
    direction += clamp(diff, -turn_speed, turn_speed);
	if (diff != 0){
		speed -= 0.2;
	}
	else speed += 0.5;
	speed = clamp(speed, 2, 8);
}
}

x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);
image_angle = direction - 90;

if (x < -50 || x > 800 || y < -50 || y > 600)
{
    instance_destroy();
}

var boss = instance_place(x, y, obj_boss);
var enemy = instance_place(x, y, obj_enemy);

if (boss != noone)
{
	audio_play_sound(sfx_boss_dmg, 1, false);
    boss.hp -= damage;
    boss.hit_flash = 5;
	add_score(10);

    instance_destroy();
}

if (enemy != noone){
	audio_play_sound(sfx_boss_dmg, 1, false);
	enemy.hp -= damage;
	add_score(10);
	instance_destroy();
}