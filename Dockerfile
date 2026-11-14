FROM openscad/openscad:trixie@sha256:3a040760d376ccbb3bff07e44a1be3c2570435f093f5fa4bf08e3991e7412b8c

WORKDIR /openscad

# Debian drops superseded package versions from its mirrors, so exact apt pins
# break the build on every point release; the base image digest pins them instead.
# hadolint ignore=DL3008
RUN apt-get update && \
    apt-get install \
        python3 \
        python3-venv \
        -y --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    python3 -m venv /opt/venv && \
    mkdir /data

ENV PATH="/opt/venv/bin:$PATH"

COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

COPY ./scripts/* main.py main.scad ./
COPY qr_code ./qr_code/
COPY include ./include/

RUN chmod +x ./run.sh

CMD ["./run.sh"]
