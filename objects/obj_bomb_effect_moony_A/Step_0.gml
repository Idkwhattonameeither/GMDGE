switch (state)
{
    case "expand":
        radius += speed_r;

        if (radius >= max_radius)
        {
            with (obj_bullet_parent)
			{
				instance_create_layer(x, y, "Instances", obj_bullet_point);

				instance_destroy();
			}
			with (obj_bullet)
			{
				instance_create_layer(x, y, "Instances", obj_bullet_point);

				instance_destroy();
			}
			with (obj_boss)
			{
				hp -= global.bomb_damage;
			}
			with(obj_enemy_stage_6)
			{
				hp -= global.bomb_damage;
			}

            state = "fade";
        }
    break;

    case "fade":
        alpha -= 0.05;

        if (alpha <= 0)
        {
            instance_destroy();
        }
    break;
}