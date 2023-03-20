function decide_magnets(
    magnets_height,
    magnets_diameter
) = magnets_height > 0 && magnets_diameter > 0;

function calc_magnet_x_pos(
    plate_width,
    magnets_diameter
) = plate_width / 2 - magnets_diameter * 0.75;

function calc_magnet_y_pos(
    plate_depth,
    y_pos,
    magnets_diameter
) = plate_depth / 2 - y_pos - magnets_diameter * 0.75;
