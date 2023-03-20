use <utils.scad>

module magnets(
    plate_width,
    plate_depth,
    y_pos,
    magnets_diameter,
    magnets_height
) {
    translate([
        calc_magnet_x_pos(
            plate_width,
            magnets_diameter
        ),
        calc_magnet_y_pos(
            plate_depth,
            y_pos,
            magnets_diameter
        ),
        -0.01
    ]){
        color("red")
        cylinder(magnets_height, d=magnets_diameter);
    }

    translate([
        -calc_magnet_x_pos(
            plate_width,
            magnets_diameter
        ),
        calc_magnet_y_pos(
            plate_depth,
            y_pos,
            magnets_diameter
        ),
        -0.01
    ]){
        color("red")
        cylinder(magnets_height, d=magnets_diameter);
    }

    translate([
        -calc_magnet_x_pos(
            plate_width,
            magnets_diameter
        ),
        -calc_magnet_y_pos(
            plate_depth,
            y_pos,
            magnets_diameter
        ),
        -0.01
    ]){
        color("red")
        cylinder(magnets_height, d=magnets_diameter);
    }

    translate([
        calc_magnet_x_pos(
            plate_width,
            magnets_diameter
        ),
        -calc_magnet_y_pos(
            plate_depth,
            y_pos,
            magnets_diameter
        ),
        -0.01
    ]){
        color("red")
        cylinder(magnets_height, d=magnets_diameter);
    }
}
