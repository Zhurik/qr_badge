FROM openscad/openscad

RUN apt-get update && \
    apt-get install python3 python3-pip -y && \
    mkdir /data

COPY requirements.txt ./

RUN python3 -m pip install -r requirements.txt

COPY ./scripts/* main.py main.scad ./
COPY qr_code ./qr_code/
COPY include ./include/

RUN chmod +x ./run.sh

CMD ./run.sh
