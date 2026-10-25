function drop_bomb(amount){
    for (var i = 0; i < amount; i += 1)
    {
        instance_create_layer(x, y, "Items", obj_item_bomb);
    }
}