var p = instance_find(obj_player_shmup, 0);

var dist = point_distance(x, y, p.x, p.y);

var graze_radius = 20;

if (!instance_exists(p)) exit;

// destroy off-screen
if (x < -50 || x > 434 || y < -50 || y > 554)
{
    instance_destroy();
}

switch (shape){
	case "small_circle":
	hitbox_radius = 0.5;
	sprite_index = sprite_bullet_small_circle;
	
	if (!grazed && dist < graze_radius)
	{	
		global.score += 20;
		grazed = true;
		global.graze += 1;
		audio_play_sound(sfx_graze, 1, false);
	}
	if (dist < graze_radius && grazed_taser == false){
		grazed_time++;
		if (grazed_time >= 20){
			grazed_taser = true;
			global.score += 100;
			global.graze += 5;
			audio_play_sound(sfx_graze_item, 0, false);
		}
	}

	if (dist < hitbox_radius + p.hitbox_radius)
	{
		if (!p.invincible)
		{
        player_hit();
		}
    
		instance_destroy();
	}
	break;
	
	case "medium_circle":
	hitbox_radius = 1.5;
	graze_radius = 25;
	sprite_index = sprite_bullet_medium_circle;
	
	if (!grazed && dist < graze_radius)
	{	
		global.score += 20;
		grazed = true;
		global.graze += 1;
		audio_play_sound(sfx_graze, 1, false);
	}
	if (dist < graze_radius && grazed_taser == false){
		grazed_time++;
		if (grazed_time >= 6){
			grazed_taser = true;
			global.score += 100;
			global.graze += 5;
			audio_play_sound(sfx_graze_item, 0, false);
		}
	}

	if (dist < hitbox_radius + p.hitbox_radius)
	{
		if (!p.invincible)
		{
        player_hit();
		}
    
		instance_destroy();
	}
	break;
	
	case "rice":
    hitbox_radius = 0.75;
	sprite_index = sprite_bullet_small_rice;
	
	if (!grazed && dist < graze_radius)
	{	
		global.score += 20;
		grazed = true;
		global.graze += 1;
		audio_play_sound(sfx_graze, 1, false);
	}
	if (dist < graze_radius && grazed_taser == false){
		grazed_time++;
		if (grazed_time >= 12){
			grazed_taser = true;
			global.score += 100;
			global.graze += 5;
			audio_play_sound(sfx_graze_item, 0, false);
		}
	}

	if (dist < hitbox_radius + p.hitbox_radius)
	{
		if (!p.invincible)
		{
        player_hit();
		}
    
		instance_destroy();
	}
	break;
	
	case "card":
	hitbox_radius = 1;
	graze_radius = 40;
	sprite_index = sprite_bullet_card;
	
	if (!grazed && dist < graze_radius)
	{	
		global.score += 20;
		grazed = true;
		global.graze += 1;
		audio_play_sound(sfx_graze, 1, false);
	}
	if (dist < graze_radius && grazed_taser == false){
		grazed_time++;
		if (grazed_time >= 20){
			grazed_taser = true;
			global.score += 100;
			global.graze += 5;
			audio_play_sound(sfx_graze_item, 0, false);
		}
	}

	if (dist < hitbox_radius + p.hitbox_radius)
	{
		if (!p.invincible)
		{
        player_hit();
		}
    
		instance_destroy();
	}
	break;
	
	case "large_circle":
	hitbox_radius = 3;
	graze_radius = 60;
	sprite_index = sprite_bullet_large_circle;
	
	if (!grazed && dist < graze_radius)
	{	
		global.score += 20;
		grazed = true;
		global.graze += 1;
		audio_play_sound(sfx_graze, 1, false);
	}
	if (dist < graze_radius && grazed_taser == false){
		grazed_time++;
		if (grazed_time >= 20){
			grazed_taser = true;
			global.score += 100;
			global.graze += 5;
			audio_play_sound(sfx_graze_item, 0, false);
		}
	}

	if (dist < hitbox_radius + p.hitbox_radius)
	{
		if (!p.invincible)
		{
        player_hit();
		}
    
		instance_destroy();
	}
	break;
	
	case "bubble":
	hitbox_radius = 10;
	sprite_index = sprite_bullet_bubble;
	
	if (!grazed && dist < graze_radius)
	{	
		global.score += 20;
		grazed = true;
		global.graze += 1;
		audio_play_sound(sfx_graze, 1, false);
	}
	if (dist < graze_radius && grazed_taser == false){
		grazed_time++;
		if (grazed_time >= 20){
			grazed_taser = true;
			global.score += 100;
			global.graze += 5;
			audio_play_sound(sfx_graze_item, 0, false);
		}
	}

	if (dist < hitbox_radius + p.hitbox_radius)
	{
		if (!p.invincible)
		{
        player_hit();
		}
    
		instance_destroy();
	}
	break;
	
	case "tac":
	hitbox_radius = 2;
	sprite_index = sprite_bullet_tictac;
	
	if (!grazed && dist < graze_radius)
	{	
		global.score += 20;
		grazed = true;
		global.graze += 1;
		audio_play_sound(sfx_graze, 1, false);
	}
	if (dist < graze_radius && grazed_taser == false){
		grazed_time++;
		if (grazed_time >= 20){
			grazed_taser = true;
			global.score += 100;
			global.graze += 5;
			audio_play_sound(sfx_graze_item, 0, false);
		}
	}

	if (dist < hitbox_radius + p.hitbox_radius)
	{
		if (!p.invincible)
		{
        player_hit();
		}
    
		instance_destroy();
	}
	break;
}

switch (state)
{
    case "expand":
		
		timer++;
        if (timer > 75)
        {
            state = "duplicate";
            timer = 0;
        }
        
    break;

    case "duplicate":
        for (var i = 0; i < sides; i++)
        {
            var angle = random_bullet_angle + i * (360 / sides);

            var nb = spawn_bullet(x, y, diff(1.5, 1.6, 1.7, 1.75), angle, "card", bullet_blue, "attack");
            nb.timer = 0;
        }

        instance_destroy();

    break;

    case "attack":
    break;
	
	case "flow":
	timer++;
	flow_timer--;

	if (timer < 15)
	{
	}
	else
	{
		var t = clamp((timer - 20) / 30, 0, 1);
		direction += rot_speed * t;
	}
	if(flow_timer <= 0){
        if (instance_exists(p)){
			spawn_bullet(x, y, diff(1, 1.25, 1.5, 1.75), point_direction(x, y, p.x, p.y), "small_circle", c_green, "attack");
		}
		flow_timer = diff(80, 75, 70, 60);
	}
	break;
	
	case "spin":
	timer++;
	if(timer < spin_timer){
	direction += rot_speed;
	}
	break;
		
	case "timed_accel":
	timer++;
	if(accel >= 0){
	if (timer >= countdown && speed <= cap){
		speed += accel;
	}
	if (speed >= cap){
		speed = cap;
		state = next_state;
	}
	}
	else if(accel < 0){
		if (timer >= countdown && speed >= cap){
		speed += accel;
	}
	if (speed <= cap){
		speed = cap;
		state = next_state;
	}
	}
	break;
	
	case "wait_then_accel_aim":
	aim_timer--;
	if(aim_timer <= 0){
	direction = point_direction(x, y, p.x, p.y);
	state = "accel";
	}
	break;
	
	case "accel":
	if(acc >= 0){
	if(speed <= accel_cap){
		speed += acc;
	}
	if (speed >= accel_cap) state = "attack";
	}
	else if(acc < 0){
	if(speed >= accel_cap){
		speed += acc;
	}
	if (speed <= accel_cap) state = "attack";
	}	
	break;
	
	case "bounce":

        if (x <= 0 || x >= 384)
        {
            direction = 180 - direction;
            x = clamp(x, 0, 384);
			reflect++;
        }

        if (y <= 0)
        {
            direction = -direction;
			reflect++;
		}
		
		if(reflect >= times)
		{
		state = "attack";
		}
		
		break;
		
	case "random_bounce":

        if (x <= 0 || x >= 384)
        {
            direction = random(360);
            x = clamp(x, 0, 384);
			image_blend = c_white;
			reflect++;
        }

        if (y <= 0)
        {
            direction = random(360);
			image_blend = c_white;
			reflect++;
		}
		
		if(reflect >= times)
		{
		state = "attack";
		}
		
		break;
		
	case "star_spiral":
    wait_timer--;
    
    if (wait_timer <= 0) {
        speed = diff(1, 1.2, 1.4, 1.8);
    } else {
        // Stationary during initial formation telegraph
        speed = 0;
    }
	break;
}


image_angle = direction;