include <include/badge.scad>

qr_svg_path = "qr.svg";
echo(str("Using qr file ", qr_svg_path));

qr_size = 100;
echo(str("QR size = ", qr_size));
qr_height = 2.5;
echo(str("QR height = ", qr_height));

qr_offset = 5;
echo(str("Qr offset = ", qr_offset));

border_radius = 5;
echo(str("Border radius = ", border_radius));

text_height = 30;
echo(str("Text height = ", text_height));

plate_height = 2.5;
echo(str("Plate height = ", plate_height));

label = "Surprise";
echo(str("Label : ", label));
text_size = 12;
echo(str("Text size = ", text_size));

ring_radius = 12;
echo(str("Ring radius = ", ring_radius));
ring_thickness = 3;
echo(str("Ring thickness = ", ring_thickness));

add_ring = true;

if (add_ring) {
    echo("Building with ring");

    union() {
        ring(
            ring_radius,
            ring_thickness,
            qr_size,
            qr_offset,
            text_height,
            plate_height
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
} else {
    echo("Building without ring");
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
