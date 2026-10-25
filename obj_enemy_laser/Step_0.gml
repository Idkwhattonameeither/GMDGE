timer++;
angle += rot_speed;
var p = instance_find(global.party_leader_data.shmup_version, 0);
if !instance_exists(p) exit;

// Calculate laser endpoint vector
var end_x = x + lengthdir_x(length, angle);
var end_y = y + lengthdir_y(length, angle);



switch (state) {
    case 0:
        current_width = 2 + sin(timer * 0.3) * 1;
        
        if (timer >= warn_time) {
            state = 1;
            timer = 0;
        }
        break;

    case 1:
        current_width = max_width;
        if (collision_line(x, y, end_x, end_y, global.party_leader_data.shmup_version, false, false)) {
            with (global.party_leader_data.shmup_version) {
				if(!invincible){
                player_hit()
				}
            }
        }
		
		if (graze_timer > 0) {
		graze_timer--;
		} 
		else {
		var dist = scr_dist_to_segment(p.x, p.y, x, y, end_x, end_y);
		var graze_threshold = (max_width / 2) + 25;
            
		if (dist <= graze_threshold) {
		global.graze++;
		graze_timer = graze_cooldown;
                
		audio_play_sound(sfx_graze, 0, false);
            }
        }

        if (timer >= active_time) {
            state = 2;
            timer = 0;
        }
        break;

    case 2: // FADING PHASE
        current_width = lerp(max_width, 0, timer / fade_time);
        
        if (timer >= fade_time) {
            instance_destroy();
        }
        break;
}
switch move_state{
	case "attack":
	break;
	
	case "ricky_sc3":
	move_timer--;
	if (move_timer <= 0){
		if(!circle_spawned){
			circle = instance_create_layer(p.x, p.y, "Instances", obj_spell_circle_persistent);
			circle_spawned = true;
		}
		if(instance_exists(circle)){
		x += lengthdir_x(0.5, point_direction(x, y, circle.x, circle.y));
		y += lengthdir_y(0.5, point_direction(x, y, circle.x, circle.y));
		if (abs(x - circle.x) <= 10 && abs(y - circle.y) <= 10){
		with circle instance_destroy();
		circle_spawned = false;
		move_timer = 180;
		}
		}
		
	}
	break;
}