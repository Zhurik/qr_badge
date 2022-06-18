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

## TODO

- [ ] Pass parameters to Docker image

- [ ] Refactor SCAD files

- [ ] Add optional ring

- [ ] Add optional border

- [ ] Generate QR svg from parameters

- [ ] Add ability to preview badge

- [x] ~~Add examples~~

- [x] ~~Add Dockerfile for image building~~
