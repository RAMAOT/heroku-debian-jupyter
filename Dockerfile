FROM pl31/debian-jupyter-notebook:stretch
MAINTAINER Patrick Büch <dh@paco.pl31.de>

RUN echo "Europe/Berlin" > /etc/timezone && \
    dpkg-reconfigure tzdata

# heroku uses user 'dyno'
RUN useradd --create-home dyno

COPY files/ /
RUN chown -R dyno:dyno /home/dyno

# Runtime CMD goes to heroku.yml
