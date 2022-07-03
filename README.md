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
docker run --mount type=bind,source="$(pwd)"/,target=/data qr_badger
```

You can freely pass parameters to change the result of output model. For example:

```bash
docker run \
    -e LABEL='New label' \
    -e ADD_RING=false \
    -e QR_SIZE=150 \
    --mount type=bind,source="$(pwd)"/,target=/data qr_badger
```

Full list of parameters:

- QR_SIZE

- QR_HEIGHT

- QR_OFFSET

- BORDER_RADIUS

- BORDER_RADIUS

- TEXT_HEIGHT

- PLATE_HEIGHT

- LABEL

- TEXT_SIZE

- RING_RADIUS

- RING_THICKNESS

- ADD_RING

- ADD_BORDER

## Features

- [x] Optional border

- [x] Optional ring at the top

- [x] Docker image to generate STL from given parameters

- [ ] Optional hole at the top

- [ ] Make text optional

- [ ] Ability to add external fonts

- [ ] Generate QR svg from parameters

- [ ] Preview badge from dockerfile
