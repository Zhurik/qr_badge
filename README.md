# QR badge

Simple scad to generate model of badge with qr code

PLACEHOLDER FOR IMAGE

## How to create STL with docker

1. Prepare svg file of your desired QR code

2. Change all necessary parameters in ```badge.scad``` file

3. Build docker image

```bash
docker build -it qr_badger .
```

4. Run given image

```bash
docker run --mount type=bind,source="$(pwd)"/,target=/output qr_badger
```

## TODO

- [ ] Pass parameters to Docker image

- [ ] Refactor SCAD files

- [ ] Add examples

- [ ] Add optional ring

- [ ] Add optional border

- [ ] Generate QR svg from parameters

- [ ] Add ability to preview badge

- [x] ~~Add Dockerfile for image building~~
