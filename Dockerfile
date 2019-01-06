FROM pl31/debian-jupyter-notebook:stretch
MAINTAINER Patrick Büch <dh@paco.pl31.de>

RUN echo "Europe/Berlin" > /etc/timezone && \
    dpkg-reconfigure tzdata

RUN useradd --create-home jupyter

COPY files/ /
RUN chown -R jupyter:jupyter /home/jupyter

# Runtime CMD will also go to heroku.yml
CMD runuser -l jupyter -c "PORT=$PORT /usr/local/bin/start_jupyter"
