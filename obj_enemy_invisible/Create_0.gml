function create(){
state = "move";

shot_timer = 0;
attack_delay = 2;
speed = diff(5, 2.5, 1.5, 1);
angle = 90;
timer = 0;
flip_timer = 0;
rotation_speed = 0;
expand_speed = 0;
max_radius = 0;
radius = 0;
dir = 0;
angle = 0;
target_x = 0;
target_y = 0;
laser_spawned = false;
final_x = 0;
final_y = 0;

hp = 10000000;
}

create();