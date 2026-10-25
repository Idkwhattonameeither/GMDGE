function drop_power(amount)
{
	for (var i = 0; i < floor(amount); i++){
		instance_create_layer(x, y, "Items", obj_item_power_large);
	}
    for (var i = 0; i < amount - floor(amount); i += 0.01)
    {
        var xx = x + random_range(-30, 30);
        var yy = y + random_range(-30, 30);

        instance_create_layer(xx, yy, "Items", obj_item_power);
    }
}