FROM openscad/openscad

RUN mkdir /data

ENV QR_SIZE=100 \
    QR_HEIGHT=2.5 \
    QR_OFFSET=5 \
    BORDER_RADIUS=5 \
    BORDER_THICKNESS=5 \
    TEXT_HEIGHT=30 \
    PLATE_HEIGHT=2.5 \
    LABEL="Surprise" \
    TEXT_SIZE=12 \
    RING_RADIUS=12 \
    RING_THICKNESS=3 \
    ADD_RING=true \
    ADD_BORDER=false

ADD include ./include
ADD main.scad .
ADD qr.svg .

CMD openscad main.scad \
    -o /data/badge.stl \
    -D qr_size=${QR_SIZE} \
    -D qr_height=${QR_HEIGHT} \
    -D qr_offset=${QR_OFFSET} \
    -D border_radius=${BORDER_RADIUS} \
    -D border_thickness=${BORDER_THICKNESS} \
    -D text_height=${TEXT_HEIGHT} \
    -D plate_height=${PLATE_HEIGHT} \
    -D label=\""${LABEL}"\" \
    -D text_size=${TEXT_SIZE} \
    -D ring_radius=${RING_RADIUS} \
    -D ring_thickness=${RING_THICKNESS} \
    -D add_ring=${ADD_RING} \
    -D add_border=${ADD_BORDER}
