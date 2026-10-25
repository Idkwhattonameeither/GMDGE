function shoot_shmup()
{   
if(global.party_leader_data.shmup_version = obj_moony_day_player_shmup && global.shot_type = 0){
	audio_play_sound(sfx_player_shoot, 0, false);
	var shot_level = floor(shot_power + 1);
    shot_level = min(shot_level, 6);
	var shot_number = ceil(shot_level / 2 + 1.5);

    var spacing = focused ? 9 : 12;
	var bullet_type = focused ? focused_type[0] : unfocused_type[0];
	var angle = focused ? 0 : 12;
    for (var i = 0; i < shot_number; i++)
    {
        var offset = (i - (shot_number - 1) / 2) * spacing;
		var off_angle = (i - (shot_number - 1) / 2) * angle;

        var b = instance_create_layer(x + offset, y - 10, "Instances", bullet_type);
        b.direction = 90 - off_angle;
        b.speed = 12;
    }
}

if(global.party_leader_data.shmup_version = obj_moony_day_player_shmup && global.shot_type = 1){
	var shot_number = min(4, floor(shot_power));
	
    var spacing = focused ? 12 : 24;
	var bullet_type = focused ? focused_type[1] : unfocused_type[1];
	var angle = focused ? 0 : 10;
    for (var i = 0; i < shot_number; i++)
    {
        var offset = (i - (shot_number - 1) / 2) * spacing;
		var off_angle = (i - (shot_number - 1) / 2) * angle;

        var b = instance_create_layer(x + offset, y - 10, "Instances", bullet_type, {direction: 90 - off_angle, after_x: x + offset + lengthdir_x(1200, 90 - off_angle), after_y: y - 10 + lengthdir_y(1200, 90 - off_angle)});
        b.speed = 0;
    }
}

if(global.party_leader_data.shmup_version = obj_moony_day_player_shmup && global.shot_type = 2){
	audio_play_sound(sfx_player_shoot, 0, false);
	var shot_number = floor(shot_power);
	var angle = focused ? 10 : 2.5;
	var bullet_type = focused ? focused_type[2] : unfocused_type[2];
	
		for(var i = 0; i < shot_number; i++){
			var bi = (i - (shot_number - 1) / 2);
			var bx = x + lengthdir_x(35, bi * angle - 90);
			var by = y + lengthdir_y(35, bi * angle - 90);
			var b = instance_create_layer(bx, by, "Instances", bullet_type);
			b.direction = 90 + angle * bi;
			b.speed = 12;
		}
	}
}