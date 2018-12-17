FROM pl31/debian-jupyter-notebook:stretch
MAINTAINER Patrick Büch <dh@paco.pl31.de>

# install services
RUN echo "Europe/Berlin" > /etc/timezone && \
    dpkg-reconfigure tzdata

RUN apt-get install -y python3-nose

COPY files/ /

# Runtime CMD will go to heroku.yml
