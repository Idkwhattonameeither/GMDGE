function shoot_default_shmup()
{
	audio_play_sound(sfx_player_shoot, 1, false);
	
	for (var i = -0.5; i <= 0.5; i++){
		var offset = 8 * i;

        var b = instance_create_layer(x + offset, y - 10, "Instances", default_type);
        b.direction = 90;
        b.speed = 15;
	}
}