# QR badge

Simple scad to generate STL model of badge with qr code.

I designed it to make simple badge to help people connect to WIFI, but you can use it however you want!

![example image](./img/surprise.png)

## How to create STL with docker

1. Prepare svg file of your desired QR code

2. Put it in the same folder as ```badge.scad``` and call it ```qr.svg```

2. Change all necessary parameters in ```badge.scad``` file

3. Build docker image

```bash
docker build -t qr_badger .
```

4. Run given image

```bash
docker run --mount type=bind,source="$(pwd)"/,target=/output qr_badger
```

You can freely pass parameters to change the result of output model. For example:

```bash
docker run \
    -e LABEL='New label' \
    -e ADD_RING=false \
    -e QR_SIZE=150 \
    --mount type=bind,source="$(pwd)"/,target=/output qr_badger
```

Full list of parameters:

- QR_SIZE

- QR_HEIGHT

- QR_OFFSET

- BORDER_RADIUS

- TEXT_HEIGHT

- PLATE_HEIGHT

- LABEL

- TEXT_SIZE

- RING_RADIUS

- RING_THICKNESS

- ADD_RING

## TODO

- [ ] Add optional border

- [ ] Make text optional

- [ ] Add ability to add fonts

- [ ] Generate QR svg from parameters

- [ ] Add ability to preview badge

- [x] ~~Pass parameters to Docker image~~

- [x] ~~Add optional ring~~

- [x] ~~Refactor SCAD files~~

- [x] ~~Add examples~~

- [x] ~~Add Dockerfile for image building~~
