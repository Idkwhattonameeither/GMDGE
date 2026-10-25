if (sprite_exists(cutin_sprite)) {
    // Dynamically scale sprite so high-res art fits ~90% of GUI height perfectly
    var target_height = gui_h * 0.90; 
    var spr_h = sprite_get_height(cutin_sprite);
    var scale = target_height / spr_h;
	
    // Draw the cut-in sprite with high-res downscaling
    gpu_set_tex_filter(true); // Smooths high-res art when scaled down
    draw_sprite_ext(
        cutin_sprite, 0, 
        current_x, gui_h, 
        scale, scale, 0, 
        c_white, alpha
    );
    gpu_set_tex_filter(false); // Restore pixel-grid filtering for rest of HUD
}