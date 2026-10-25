function cancel_laser(){
	with (obj_enemy_laser)
    {
		var dx = lengthdir_x(1000, angle)
		var real_x = clamp(x + dx, 0, 384);
		var dy = lengthdir_y(1000, angle)
		var real_y = clamp(y + dy, 0, 504);
		var count = point_distance(x, real_x, y, real_y);
		for(var i = 0; i <= count; i++){
        var item = instance_create_layer(x + i * (real_x - x) / count, y + i * (real_y - y) / count, "Instances", obj_bullet_point);
		
        item.value = 20;
		}
        
        instance_destroy();
	}
}