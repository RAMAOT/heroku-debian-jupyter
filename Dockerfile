FROM ramaot/debian-jupyter-notebook:stretch
MAINTAINER Patrick Büch <dh@paco.pl31.de>

RUN echo "Europe/Berlin" > /etc/timezone && \
    dpkg-reconfigure tzdata

COPY files/ /
RUN chown -R jupyter:jupyter /home/jupyter

# Runtime CMD goes to heroku.yml
