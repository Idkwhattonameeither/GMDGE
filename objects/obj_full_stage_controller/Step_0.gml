if(!stage_started[stage_no] && !instance_exists(stage_controller[max(stage_no - 1, 0)])){
	instance_create_layer(0, 0, "UI", stage_controller[stage_no]);
	stage_no++;
	stage_started[stage_no] = true;
}

if (global.score >= 10000000 && first_1up == false){
	global.lives = min(global.lives + 1, global.max_lives);
	audio_play_sound(sfx_extend, 1, false);
	first_1up = true;
}
if (global.score >= 20000000 && second_1up == false){
	global.lives = min(global.lives + 1, global.max_lives);
	audio_play_sound(sfx_extend, 1, false);
	second_1up = true;
}
if (global.score >= 40000000 && third_1up == false){
	global.lives = min(global.lives + 1, global.max_lives);
	audio_play_sound(sfx_extend, 1, false);
	third_1up = true;
}
if (global.score >= 80000000 && fourth_1up == false){
	global.lives = min(global.lives + 1, global.max_lives);
	audio_play_sound(sfx_extend, 1, false);
	fourth_1up = true;
}
if (global.score >= 120000000 && fifth_1up == false){
	global.lives = min(global.lives + 1, global.max_lives);
	audio_play_sound(sfx_extend, 1, false);
	fifth_1up = true;
}
if (global.score >= 200000000 && sixth_1up == false){
	global.lives = min(global.lives + 1, global.max_lives);
	audio_play_sound(sfx_extend, 1, false);
	sixth_1up = true;
}

if(instance_exists(obj_stage_controllers)) exit;