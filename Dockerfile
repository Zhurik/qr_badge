FROM openscad/openscad

RUN mkdir /output

ADD include ./include
ADD qr.svg .
ADD main.scad .

CMD openscad -o /output/badge.stl main.scad
