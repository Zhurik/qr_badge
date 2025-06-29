FROM openscad/openscad@sha256:147e48525bec392bcf628d7a6d5ea4ccac71b16251952328f86e1061cbf47c37

WORKDIR /openscad

RUN apt-get update && \
    apt-get install \
        python3=3.7.3-1 \
        python3-pip=18.1-5 \
        -y --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir /data

COPY requirements.txt ./

RUN python3 -m pip install --no-cache-dir -r requirements.txt

COPY ./scripts/* main.py main.scad ./
COPY qr_code ./qr_code/
COPY include ./include/

RUN chmod +x ./run.sh

CMD ./run.sh
# CMD ["./run.sh"]
