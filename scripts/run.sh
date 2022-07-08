#!/bin/sh

python3 main.py \
    -s ${WIFI_SSID} \
    -p ${WIFI_PASSWORD} \
    -t ${WIFI_AUTH_TYPE} && \
    openscad main.scad \
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
