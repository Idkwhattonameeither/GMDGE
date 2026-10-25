function drop_points(amount)
{
    for (var i = 0; i < amount; i++)
    {
        var xx = x + random_range(-30, 30);
        var yy = y + random_range(-30, 30);

        instance_create_layer(xx, yy, "Items", obj_item_point);
    }
}