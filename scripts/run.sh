#!/bin/sh

if [ -z ${SVG_PATH} ]
then
    echo "Generating SVG from parameters"
else
    cp /data/${SVG_PATH} /openscad/qr.svg
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
    exit 1;
fi;

if [ -z "$WIFI_SSID" ]
then
    echo "Missing WIFI_SSID env"
    exit 1
fi;

if [ -z ${WIFI_PASSWORD} ] && [ ${WIFI_AUTH_TYPE} != "nopass" ]
then
    echo "Missing WIFI_PASSWORD env with ${WIFI_AUTH_TYPE}"
    exit 1
fi;

if [ "$WIFI_AUTH_TYPE" = "nopass" ]
then
   if [ ${WIFI_HIDDEN} ]
    then
        python3 main.py \
            -s \""${WIFI_SSID}"\" \
            -t nopass \
            --hidden
    else
        python3 main.py \
            -s \""${WIFI_SSID}"\" \
            -t nopass
    fi;
else
    if [ ${WIFI_HIDDEN} ]
    then
        python3 main.py \
            -s \""${WIFI_SSID}"\" \
            -p ${WIFI_PASSWORD} \
            -t ${WIFI_AUTH_TYPE} \
            --hidden
    else
        python3 main.py \
            -s \""${WIFI_SSID}"\" \
            -p ${WIFI_PASSWORD} \
            -t ${WIFI_AUTH_TYPE}
    fi;
fi;

if [ $? -ne 0 ]
then
    echo "There was an error with generating SVG file. Exiting..."
    exit 1;
fi;

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
