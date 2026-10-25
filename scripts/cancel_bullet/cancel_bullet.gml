function cancel_bullet(){
    with (obj_bullet_parent)
    {
        var item = instance_create_layer(x, y, "Instances", obj_bullet_point);
		
        item.value = 20;
        
        instance_destroy();
	}
    with (obj_bullet)
    {
        var item = instance_create_layer(x, y, "Instances", obj_bullet_point);
		
        item.value = 20;
        
        instance_destroy();
	}
}