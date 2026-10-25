function shoot_shmup_tournament()
{
	var shot_number = 2;

    var spacing = focused ? 4 : 12;

    for (var i = 0; i < shot_number; i++)
    {
        var offset = (i - (shot_number - 1) / 2) * spacing;

        var b = instance_create_layer(x + offset, y - 10, "Instances", bullet_type);
        b.direction = 90;
        b.speed = 12;
		b.side = side;
    }
}