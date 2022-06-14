FROM openscad/openscad

ADD badge.scad .
ADD qr.svg .
ADD libraries/* .

RUN mkdir /output

CMD openscad -o /output/badge.stl badge.scad
