function set_facing(_new_facing)
{
    facing = _new_facing;

    switch (facing)
    {
        case DOWN: sprite_index = moony_day_down;  break;
        case LEFT: sprite_index = moony_day_left;  break;
        case RIGHT: sprite_index = moony_day_right; break;
        case UP: sprite_index = moony_day_up;    break;
    }
}

function actor_update_movement() {
	if (global.ui_input_lock){
		move_speed = 0;
		return;
	}
	else move_speed = 2;
    if (global.dialogue_active || global.in_transition) {
        image_speed = 0;
        return;
    }

    if (moving) {
        // Smoothly interpolate towards target position
        x = clamp(x + sign(target_x - x) * move_speed, min(x, target_x), max(x, target_x));
        y = clamp(y + sign(target_y - y) * move_speed, min(y, target_y), max(y, target_y));

        // Update facing direction based on movement vector
        var dx = target_x - x;
        var dy = target_y - y;
        if (abs(dx) > abs(dy)) {
            if (dx > 0) set_facing(2);
            else if (dx < 0) set_facing(1);
        } else if (dy != 0) {
            if (dy > 0) set_facing(0);
            else if (dy < 0) set_facing(3);
        }

        if (x == target_x && y == target_y) {
            moving = false;
        }
    } else {
        // Handle behavior based on whether this instance is currently the leader
        if (is_leader) {
            actor_handle_leader_input();
        } else {
            actor_handle_follower_movement();
        }
    }
}

function actor_handle_leader_input() {
    // Menu toggle (X key)
    if (keyboard_check_pressed(ord("X"))) {
        with (obj_menu) {
            menu_index_items = 0;
            menu_scroll_items = 0;
            menu_index_form = 0;
            if (menu_state != 0) { menu_state = 0; exit; }
            if (!menu_active) { menu_active = true; exit; }
            if (menu_state == 0 && menu_active) { menu_active = false; menu_index_main = 0; exit; }
        }
        return;
    }

    // Interaction (Z key)
    if (keyboard_check_pressed(ord("Z"))) {
        var tx = x, ty = y;
        switch (facing) {
            case 0: ty += tile_size; break;
            case 1: tx -= tile_size; break;
            case 2: tx += tile_size; break;
            case 3: ty -= tile_size; break;
        }
        var inst = instance_place(tx, ty, obj_interact);
        if (inst != noone) inst.interact();
        return;
    }

    // Movement input
    var dx = 0, dy = 0, new_facing = facing;
    if (keyboard_check(vk_left))      { dx = -1; new_facing = 1; }
    else if (keyboard_check(vk_right)) { dx = 1;  new_facing = 2; }
    else if (keyboard_check(vk_up))    { dy = -1; new_facing = 3; }
    else if (keyboard_check(vk_down))  { dy = 1;  new_facing = 0; }

    if (dx != 0 || dy != 0) {
        set_facing(new_facing);
        var nx = x + dx * tile_size;
        var ny = y + dy * tile_size;

        if (!place_meeting(nx, ny, obj_collision_box)) {
            var old_x = x;
            var old_y = y;

            target_x = nx;
            target_y = ny;
            moving = true;

            // Pass leader's old position to the first follower (index 1)
            if (array_length(global.party) > 1) {
                var first_follower = global.party[1];
                array_push(first_follower.move_queue, [old_x, old_y]);
            }

            if (image_speed == 0) {
                image_index = 0;
                image_speed = 1.5;
            }
        } else {
            image_speed = 0;
            image_index = 0;
        }
    } else {
        image_speed = 0;
        image_index = 0;
    }
}

function actor_handle_follower_movement() {
    if (party_index <= 0 || party_index >= array_length(global.party)) {
        image_speed = 0;
        return;
    }

    if (array_length(move_queue) > 0) {
        var next_pos = move_queue[0];
        array_delete(move_queue, 0, 1);

        var old_x = x;
        var old_y = y;

        target_x = next_pos[0];
        target_y = next_pos[1];
        moving = true;

        // Cascade our old position down to the next follower in line
        if (party_index + 1 < array_length(global.party)) {
            var next_follower = global.party[party_index + 1];
            array_push(next_follower.move_queue, [old_x, old_y]);
        }

        if (image_speed == 0) {
            image_index = 0;
            image_speed = 1.5;
        }
    } else {
        image_speed = 0;
        image_index = 0;
        
        // Match animation state with the person directly ahead
        var prev = global.party[party_index - 1];
        if (instance_exists(prev) && prev.image_speed > 0) {
            image_speed = 1.5;
        } else {
            image_speed = 0;
            image_index = 0;
        }
    }
}

actor_update_movement();