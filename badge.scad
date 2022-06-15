use <roundedcube.scad>

qr_size = 100;
echo("QR size=", qr_size);
qr_height = 2.5;
echo("QR height=", qr_height);

qr_offset = 5;
echo("Qr offset=", qr_offset);

border_radius = 5;
echo("Border radius=", border_radius);

text_height = 30;
echo("Text height=", text_height);

plate_width = qr_size + 2 * qr_offset;
plate_depth = qr_size + 3 * qr_offset + text_height;
plate_height = 2.5;
echo("Plate height=", plate_height);

label = "My WIFI";
echo("Label is ", label);

ring_radius = 12;
echo("Ring radius=", ring_radius);
ring_thickness = 3;
echo("Ring thickness=", ring_thickness);

union() {
    // Ring
    color("white")
    translate([
        0,
        qr_size / 2 + text_height + qr_offset * 2 + ring_radius - ring_thickness,
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

    // Text
    color("black")
    translate([
        0,
        qr_size / 2 + text_height / 2 + qr_offset,
        plate_height
    ]) {
        linear_extrude(height=qr_height)
        text(
            label,
            12,
            valign="center",
            halign="center"
        );
    }

    // Base
    color("white")
    translate([
        0,
        (text_height + qr_offset) / 2,
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
            "./qr.svg",
            center=true
        );
    }
}
