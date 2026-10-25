// 1. Lock position to the player's weapon tip
var p = instance_find(global.party_leader_data.shmup_version, 0);
if (instance_exists(p)) {
} else {
    instance_destroy();
    exit;
}

// 2. Piercing Raycast: Find all enemies along the beam line (up to top of screen / 0 y)
var _hit_list = ds_list_create();

var _count = collision_line_list(x, y, after_x, after_y, obj_enemy, false, true, _hit_list, false);

// 3. Apply continuous tick damage to every enemy hit
if state == "shoot"{
for (var i = 0; i < _count; i++) {
    var _enemy = _hit_list[| i];
    if (instance_exists(_enemy)) {
        _enemy.hp -= damage;
    }
}
}

// Clean up memory
ds_list_destroy(_hit_list);

timer--;
if timer < 0 instance_destroy();