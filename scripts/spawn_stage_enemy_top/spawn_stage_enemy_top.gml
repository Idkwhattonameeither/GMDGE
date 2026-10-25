function spawn_stage_enemy_top(_enemy, _shape, _tx, _ty, _exit_y, _attack_delay, _attack_shots)
{
    var sx = irandom_range(24, 360);
    var sy = -32;

    var e = instance_create_layer(sx, sy, "Instances", _enemy);

    e.shape = _shape;
    e.target_x = _tx;
    e.target_y = _ty;
    e.exit_x   = _tx;
    e.exit_y   = _exit_y;

    e.attack_delay = _attack_delay;
    e.attack_shots = _attack_shots;

    switch (_shape)
    {
        case "triangle":
            e.sprite_index = sprite_enemy_stage_yinyang;
			e.image_blend = c_yellow;
            e.spin_speed = 5;
        break;

        case "square":
            e.sprite_index = sprite_enemy_stage_yinyang;
			e.image_blend = c_aqua;
            e.spin_speed = 8;
        break;

        case "circle":
            e.sprite_index = sprite_enemy_stage_yinyang;
			e.image_blend = bullet_red;
            e.spin_speed = 3;
        break;
		
		case "random":
		e.sprite_index = sprite_enemy_stage_random;
		e.spin_speed = 3;
		break;
    }

    e.move_speed = diff(1, 1.1, 1.25, 1.5);
	return e;
}