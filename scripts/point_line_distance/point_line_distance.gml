function point_line_distance(px, py, x1, y1, x2, y2) {
    var l2 = sqr(x2 - x1) + sqr(y2 - y1);
    if (l2 == 0) return point_distance(px, py, x1, y1);
    
    var t = max(0, min(1, ((px - x1) * (x2 - x1) + (py - y1) * (y2 - y1)) / l2));
    var proj_x = x1 + t * (x2 - x1);
    var proj_y = y1 + t * (y2 - y1);
    
    return point_distance(px, py, proj_x, proj_y);
}