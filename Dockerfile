FROM openscad/openscad

COPY ./scripts/* requirements.txt main.py main.scad ./
COPY qr_code ./qr_code/
COPY include ./include/

RUN apt-get update && \
    apt-get install python3 python3-pip -y && \
    python3 -m pip install -r requirements.txt

RUN mkdir /data

RUN chmod +x ./run.sh

# main.py specific arguments
ENV WIFI_SSID="" \
    WIFI_PASSWORD="" \
    WIFI_AUTH_TYPE="WPA" \
    WIFI_HIDDEN=false

# main.scad specific arguments
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

CMD ./run.sh
