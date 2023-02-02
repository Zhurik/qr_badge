use <roundedcube.scad>
use <utils.scad>

module badge(
    qr_svg_path,
    qr_size,
    qr_offset,
    qr_height,
    plate_height,
    text_height,
    label,
    text_size,
    border_radius
) {
    plate_width = calc_plate_width(qr_size, qr_offset);
    plate_depth = calc_plate_depth(qr_size, qr_offset, text_height);

    union() {
        // Text
        color("black")
        translate([
            0,
            calc_text_position(qr_size, qr_offset, text_height),
            plate_height
        ]) {
            linear_extrude(height=qr_height)
            text(
                label,
                text_size,
                valign="center",
                halign="center"
                // Placeholder for defining custom font family
                // ,font="PLACEHOLDER"
            );
        }

        // Base
        color("white")
        translate([
            0,
            calc_y_pos(text_height, qr_offset),
            plate_height / 2
        ]) {
            resize([
                plate_width,
                plate_depth,
                plate_height
            ])
            roundedcube(
                [
                    plate_width,
                    plate_depth,
                    plate_height
                ],
                center=true,
                radius=border_radius,
                apply_to="z"
            );
        }

        // QR code
        color("black")
        translate([
            0,
            0,
            plate_height
        ]) {
            linear_extrude(height=qr_height)
            resize([
                qr_size,
                qr_size,
                0
            ])
            offset(0.01)  // To fix compile error
            import(
                qr_svg_path,
                center=true
            );
        }
    }
}

module badge_with_border(
    qr_svg_path,
    qr_size,
    qr_offset,
    qr_height,
    plate_height,
    text_height,
    label,
    text_size,
    border_radius,
    border_thickness
) {
    plate_width = calc_plate_width(qr_size, qr_offset) + 2 * border_thickness;
    plate_depth = calc_plate_depth(qr_size, qr_offset, text_height) + 2 * border_thickness;

    union() {
        // Text
        color("black")
        translate([
            0,
            calc_text_position(qr_size, qr_offset, text_height),
            plate_height
        ]) {
            linear_extrude(height=qr_height)
            text(
                label,
                text_size,
                valign="center",
                halign="center"
                // Placeholder for defining custom font family
                // ,font="PLACEHOLDER"
            );
        }

        // Base
        color("white")
        translate([
            0,
            calc_y_pos(text_height, qr_offset),
            plate_height / 2
        ]) {
            resize([
                plate_width,
                plate_depth,
                plate_height
            ])
            roundedcube(
                [
                    plate_width,
                    plate_depth,
                    plate_height
                ],
                center=true,
                radius=border_radius * 2,
                apply_to="z"
            );
        }

        // Border
        color("black")
        difference() {
            translate([
                0,
                calc_y_pos(text_height, qr_offset),
                plate_height / 2 * 3 - 0.001
            ]) {
                resize([
                    plate_width,
                    plate_depth,
                    qr_height
                ])
                roundedcube(
                    [
                        plate_width,
                        plate_depth,
                        qr_height
                    ],
                    center=true,
                    radius=border_radius * 2,
                    apply_to="z"
                );
            }

            translate([
                0,
                calc_y_pos(text_height, qr_offset),
                plate_height / 2 * 3
            ]) {
                resize([
                    plate_width - 2 * border_thickness,
                    plate_depth - 2 * border_thickness,
                    qr_height + 0.001
                ])
                roundedcube(
                    [
                        plate_width - 2 * border_thickness,
                        plate_depth - 2 * border_thickness,
                        qr_height
                    ],
                    center=true,
                    radius=border_radius,
                    apply_to="z"
                );
            }
        }

        // QR code
        color("black")
        translate([
            0,
            0,
            plate_height
        ]) {
            linear_extrude(height=qr_height)
            resize([
                qr_size,
                qr_size,
                0
            ])
            offset(0.01)  // To fix compile error
            import(
                qr_svg_path,
                center=true
            );
        }
    }
}

module ring(
    ring_radius,
    ring_thickness,
    qr_size,
    qr_offset,
    text_height,
    plate_height,
    add_border,
    border_thickness
) {
    color("white")
    translate([
        0,
        calc_ring_position(
            qr_size,
            qr_offset,
            text_height,
            ring_radius,
            ring_thickness,
            add_border,
            border_thickness
        ),
        plate_height / 2
    ]) {
        difference() {
            cylinder(
                plate_height,
                r=ring_radius,
                center=true
            );
            cylinder(
                plate_height + 0.01,
                r=ring_radius - ring_thickness,
                center=true
            );
        }
    }
}
