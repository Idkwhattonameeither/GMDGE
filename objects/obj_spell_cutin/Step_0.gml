timer++;

// Phase 1: Rapid slide-in and fade-in (Frames 0-12)
if (timer <= 15) {
    var t = timer / 15;
    // Smooth movement using power curves
    current_x = lerp(start_x, mid_x, power(t, 0.5));
    alpha = lerp(0, 1, t);
} 
// Phase 2: Gentle drift across screen while spell name displays (Frames 13-45)
else if (timer <= 45) {
    var t = (timer - 15) / 30;
    current_x = lerp(mid_x, mid_x + 40, t);
    alpha = 1;
} 
// Phase 3: Fast sweep off-screen right and fade-out (Frames 46-60)
else if (timer <= 70) {
    var t = (timer - 45) / 25;
    current_x = lerp(mid_x + 40, end_x, power(t, 2));
    alpha = lerp(1, 0, t);
} 
else {
    instance_destroy();
}