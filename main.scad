include <include/badge.scad>

// This line is used for adding custom fonts in docker image
// use </openscad/custom.ttf>

qr_svg_path = "qr.svg";
echo(str("Using qr file ", qr_svg_path));

qr_size = 100;
echo(str("QR size = ", qr_size));
qr_height = 0.6;
echo(str("QR height = ", qr_height));

qr_offset = 5;
echo(str("Qr offset = ", qr_offset));

border_radius = 5;
echo(str("Border radius = ", border_radius));
border_thickness = 0;
echo(str("Border thickness = ", border_radius));

magnets_height = 1.8;
magnets_diameter = 6;

plate_height = calc_plate_height(
    3,
    magnets_height,
    qr_height
);
echo(str("Plate height = ", plate_height));

label = "";
echo(str("Label: ", label));
text_size = 12;
echo(str("Text size = ", text_size));
text_height = calc_text_height(label, text_size);
echo(str("Text height = ", text_height));

ring_radius = 10;
echo(str("Ring radius = ", ring_radius));
ring_thickness = 3;
echo(str("Ring thickness = ", ring_thickness));

add_ring = decide_ring(ring_radius, ring_thickness);
add_border = decide_border(border_thickness);
add_magnets = decide_magnets(magnets_height, magnets_diameter);

echo ("Building without border, until bug is not fixed");

if (add_ring) {
    echo("Building with ring");

    if (add_magnets) {
        echo("Building with magnets");

        difference() {
            union() {
                ring(
                    ring_radius,
                    ring_thickness,
                    qr_size,
                    qr_offset,
                    text_height,
                    plate_height,
                    add_border,
                    border_thickness
                );

                badge(
                    qr_svg_path,
                    qr_size,
                    qr_offset,
                    qr_height,
                    plate_height,
                    text_height,
                    label,
                    text_size,
                    border_radius
                );
            }

            magnets(
                calc_plate_width(qr_size, qr_offset),
                calc_plate_depth(qr_size, qr_offset, text_height),
                calc_y_pos(text_height, qr_offset),
                magnets_diameter,
                magnets_height
            );
        }

    } else {
        echo("Building without magnets");

        union() {
            ring(
                ring_radius,
                ring_thickness,
                qr_size,
                qr_offset,
                text_height,
                plate_height,
                add_border,
                border_thickness
            );

            badge(
                qr_svg_path,
                qr_size,
                qr_offset,
                qr_height,
                plate_height,
                text_height,
                label,
                text_size,
                border_radius
            );
        }
    }
} else {
    echo("Building without ring");

    if (add_magnets) {
        echo("Building with magnets");

        difference() {
            badge(
                qr_svg_path,
                qr_size,
                qr_offset,
                qr_height,
                plate_height,
                text_height,
                label,
                text_size,
                border_radius
            );

            magnets(
                calc_plate_width(qr_size, qr_offset),
                calc_plate_depth(qr_size, qr_offset, text_height),
                calc_y_pos(text_height, qr_offset),
                magnets_diameter,
                magnets_height
            );
        }
    } else {
        echo("Building without magnets");

        badge(
            qr_svg_path,
            qr_size,
            qr_offset,
            qr_height,
            plate_height,
            text_height,
            label,
            text_size,
            border_radius
        );
    }
}
