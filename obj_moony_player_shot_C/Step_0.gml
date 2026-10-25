x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);
image_angle = direction - 90;

// destroy if off-screen
if (y < -10) instance_destroy();

var enemy = instance_place(x, y, obj_enemy);

if (enemy != noone){
	audio_play_sound(sfx_boss_dmg, 1, false);
	enemy.hp -= damage;
	add_score(20);
	instance_destroy();
}
if !bounced && (x <= 0 || x >= 384){
	direction = 180 - direction;
	bounced = true;
}