// move
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);

// destroy if off-screen
if (y < -10) instance_destroy();

var boss = instance_place(x, y, global.next_enemy);

if (boss != noone)
{
	audio_play_sound(sfx_boss_dmg, 1, false);
    boss.hp -= damage;
    boss.hit_flash = 5;
	add_score(20);

    instance_destroy();
}

var enemy = instance_place(x, y, obj_enemy);

if (enemy != noone){
	audio_play_sound(sfx_boss_dmg, 1, false);
	enemy.hp -= damage;
	add_score(20);
	instance_destroy();
}