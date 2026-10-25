function spawn_bullet(_x, _y, _speed, _direction, shape, color, state){
	var bullet = instance_create_layer(_x, _y, "Instances", obj_bullet);
	bullet.image_blend = color;
	bullet.speed = _speed;
	bullet.direction = _direction;
	bullet.shape = shape;
	bullet.hitbox_type = shape;
	bullet.state = state;
	return bullet;
}

function spawn_segment_laser(_x, _y, grow, _speed, _direction, max_length, color, extra_state){
	var laser = instance_create_layer(_x, _y, "Instances", obj_segment_laser);
	laser.grow_speed = grow;
	laser.move_speed = _speed;
	laser.dir = _direction;
	laser.max_len = max_length;
	laser.color_glow = color;
	laser.extra = extra_state;
	return laser;
}

function spawn_infinite_laser(_x, _y, width, angle, rot_spd, warn_time, active_time, color){
	var laser = instance_create_layer(_x, _y, "Instances", obj_enemy_laser);
	laser.max_width = width;
	laser.angle = angle;
	laser.rot_speed = rot_spd;
	laser.warn_time = warn_time;
	laser.active_time = active_time;
	laser.color_glow = color;
	return laser;
}