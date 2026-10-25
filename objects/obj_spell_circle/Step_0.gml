if(!instance_exists(global.next_enemy)){
	instance_destroy();
	exit;
}
x = global.next_enemy.x;
y = global.next_enemy.y;