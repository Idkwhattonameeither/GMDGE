var p = instance_find(global.party_leader_data.shmup_version, 0);
if !instance_exists(p) exit;

// 1. LIFECYCLE & MOVEMENT
switch (state) {
    case 0: // GROWING / EXTENDING
        current_len += grow_speed;
        
        // Advance the head position while extending
        x += lengthdir_x(grow_speed, dir);
        y += lengthdir_y(grow_speed, dir);
        
        // Once full length is reached, detach completely
        if (current_len >= max_len) {
            current_len = max_len;
            state = 1; // Transmit to FLYING state
        }
        break;

    case 1: // FLYING (Detached Segment)
        x += lengthdir_x(move_speed, dir);
        y += lengthdir_y(move_speed, dir);
        break;
}

switch extra {
	case "attack":
	break;
}

// Add to Step Event (after movement calculation):

var tail_x = x - lengthdir_x(current_len, dir);
var tail_y = y - lengthdir_y(current_len, dir);

// Graze Check (Only runs if the laser hasn't been grazed yet)
if (!grazed_taser) {
    var dist = scr_dist_to_segment(p.x, p.y, x, y, tail_x, tail_y);
    var graze_threshold = (width / 2) + 20;
    
    if (dist <= graze_threshold) {
		grazed = true;// Lock so it only grazes once
        global.graze++;
		grazed_time++;
		if (grazed_time >= 6){
			grazed_taser = true;
			global.score += 100;
			global.graze += 5;
			audio_play_sound(sfx_graze_item, 0, false);
			grazed_taser = true;
		}
        
        audio_play_sound(sfx_graze, 0, false);
    }
}

// 2. HITBOX COLLISION
// Checks line collision along the laser segment body
if (collision_line(x, y, tail_x, tail_y, global.party_leader_data.shmup_version, false, false)) {
    with (global.party_leader_data.shmup_version) {
		if(!invincible){
        player_hit()
		}
    }
}

// 3. CLEANUP
// Destroy instance once the tail leaves the screen playfield
var margin = 120;
if (tail_x < -margin || tail_x > room_width + margin || 
    tail_y < -margin || tail_y > room_height + margin) {
    instance_destroy();
}