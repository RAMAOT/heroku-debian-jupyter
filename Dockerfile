FROM pl31/debian-jupyter-notebook:stretch
MAINTAINER Patrick Büch <dh@paco.pl31.de>

RUN echo "Europe/Berlin" > /etc/timezone && \
    dpkg-reconfigure tzdata


# bad enough debian notebook (4.2.3) is somehow broken or incompatible
RUN pip3 install --no-cache-dir "notebook>4.3,<5"

# add user jupyter to run jupyter
RUN useradd --create-home -u 1031 jupyter

# install pgcontents and run it once to test dependencies
RUN apt-get -y install python3-requests python3-alembic python3-psycopg2 python3-click \
    tox python3-nose && \
    pip3 install --no-cache-dir pgcontents && \
    pgcontents --help


RUN useradd --create-home dyno

COPY files/ /
RUN chown -R dyno:dyno /home/dyno

# Runtime CMD will also go to heroku.yml
CMD runuser -l jupyter -c "PORT=$PORT /usr/local/bin/start_jupyter"
