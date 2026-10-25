var boss = instance_find(global.next_enemy, 0);
if !instance_exists(boss){
instance_destroy();
exit;
}
x = boss.x;
y = boss.y;