function decide_ring(
    ring_radius,
    ring_thickness
) = ring_radius > 0 && ring_thickness > 0;


//function decide_border(border_thickness) = border_thickness > 0;
// TODO fix bugs
function decide_border(border_thickness) = false;

function calc_ring_pos_with_border(
    qr_size,
    qr_offset,
    text_height,
    ring_radius,
    ring_thickness,
    border_thickness
) = text_height > 0 ?
    qr_size / 2 + text_height + qr_offset * 2 + ring_radius - ring_thickness + border_thickness :
    qr_size / 2 + qr_offset + ring_radius - ring_thickness + border_thickness;

function calc_ring_pos_without_border(
    qr_size,
    qr_offset,
    text_height,
    ring_radius,
    ring_thickness
) = text_height > 0 ?
    qr_size / 2 + text_height + qr_offset * 2 + ring_radius - ring_thickness :
    qr_size / 2 + qr_offset + ring_radius - ring_thickness;

function calc_ring_position(
    qr_size,
    qr_offset,
    text_height,
    ring_radius,
    ring_thickness,
    add_border,
    border_thickness
) = add_border ?
    calc_ring_pos_with_border(
        qr_size,
        qr_offset,
        text_height,
        ring_radius,
        ring_thickness,
        border_thickness
    ) :
    calc_ring_pos_without_border(
        qr_size,
        qr_offset,
        text_height,
        ring_radius,
        ring_thickness
    );

function calc_text_position(
    qr_size,
    qr_offset,
    text_height
) = qr_size / 2 + text_height / 2 + qr_offset;

function calc_plate_width(qr_size, qr_offset) = qr_size + 2 * qr_offset;

function calc_plate_depth(
    qr_size,
    qr_offset,
    text_height
) = text_height > 0 ?
    qr_size + 3 * qr_offset + text_height :
    qr_size + 2 * qr_offset;

function calc_text_height(
    label,
    text_size
) = len(label) < 1 ? 0 : text_size * 2;

function calc_y_pos(
    text_height,
    qr_offset
) = text_height > 0 ?
    (text_height + qr_offset) / 2 :
    0;

function calc_plate_height(
    plate_height,
    magnets_height,
    qr_height
) = magnets_height > 0 ?
    magnets_height * 1.5 :
    qr_height * 2;
