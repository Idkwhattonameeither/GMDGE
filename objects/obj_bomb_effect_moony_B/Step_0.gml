timer++;
var p = instance_find(global.party_leader_data.shmup_version, 0);

if (instance_exists(p)) {
    x = p.x;
    y = p.y - 40; // Position just above player
    
    // Grant player invincibility while active
    p.invuln_timer = 180; 
}

// Smoothly scale up the beam width during the first 20 frames
if (timer <= 20) {
    beam_width = lerp(10, max_width, timer / 20);
} 
// Shrink near the end
else if (timer >= duration - 20) {
    beam_width = lerp(max_width, 0, (timer - (duration - 20)) / 20);
}

// Continuously cancel bullets inside the laser's bounding box
with (obj_bullet) {
    if (point_distance(x, y, other.x, y) < other.beam_width / 2 && y < other.y) {
        // Convert bullets to point items or just delete them
		instance_create_layer(x, y, "Instances", obj_bullet_point);
        instance_destroy();
    }
}

// Deal massive continuous damage to active bosses
with (obj_enemy) {
    if (point_distance(x, y, other.x, y) < other.beam_width / 2 && y < other.y) {
        hp -= 1; // Tick damage
    }
}

if (timer >= duration) {
    instance_destroy();
}