// Find the distance to the screen boundary.
var bullet_spacing = diff(10, 8, 6, 5);
var _dx = lengthdir_x(1, ray_angle);
var _dy = lengthdir_y(1, ray_angle);

var _tx = (_dx > 0)
    ? (384 - x) / _dx
    : ((_dx < 0) ? -x / _dx : 10000000000000);

var _ty = (_dy > 0)
    ? (504 - y) / _dy
    : ((_dy < 0) ? -y / _dy : 10000000000000);

var _dist = min(_tx, _ty);
var _count = ceil(_dist / bullet_spacing);

// Spawn bullets along the original radial direction.
for (var j = 0; j <= _count; j++) {
    var _bx = x + lengthdir_x(
        bullet_spacing * j, ray_angle
    );

    var _by = y + lengthdir_y(
        bullet_spacing * j, ray_angle
    );

    var b = spawn_bullet(
        _bx, _by,
        0, random(360),
        "medium_circle",
        pattern_color,
        "timed_accel"
    );

    b.countdown = 210;
    b.accel = 0.02;
    b.cap = diff(1, 1.2, 1.3, 1.5);
}

instance_destroy();