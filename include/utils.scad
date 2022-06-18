function calc_ring_position(
    qr_size,
    qr_offset,
    text_height,
    ring_radius,
    ring_thickness
) = qr_size / 2 + text_height + qr_offset * 2 + ring_radius - ring_thickness;

function calc_text_position(
    qr_size,
    qr_offset,
    text_height
) = qr_size / 2 + text_height / 2 + qr_offset;

function calc_plate_width(qr_size, qr_offset) = qr_size + 2 * qr_offset;

function calc_plate_depth(qr_size, qr_offset, text_height) = qr_size + 3 * qr_offset + text_height;
