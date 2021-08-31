FROM alpine
MAINTAINER "Arkadiusz Stasiewicz <arkadiusz.stasiewicz@insight-centre.org>"

# Update & Dependencies
RUN apk add --update python3 py3-pip git

# Clone CubeVisualizer files into the docker container
RUN git clone https://github.com/LOSD-Data/CubeVisualizer.git /var/www/CubeVisualizer

# Copy config file
COPY config.js /var/www/CubeVisualizer/js/config.js
COPY dataCube_vis.js /var/www/CubeVisualizer/js/dataCube_vis.js

WORKDIR /var/www/CubeVisualizer

# Configure port
EXPOSE  8001

# Run python SimpleHTTPServer
CMD cd /var/www/CubeVisualizer/ && \
    /usr/bin/python3 -m http.server 8001
