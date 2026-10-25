image_angle += rot_speed;

// Clean up off-screen
if (y > room_height + 40 || y < -60) {
    instance_destroy();
}

// When shot down, give a tiny score bonus (no power/bombs) but don't damage player
if (hp <= 0) {
    add_score(250);
	var v = instance_create_layer(x, y, "UI", obj_score_add);
	v.amount = 250;
    instance_destroy();
}