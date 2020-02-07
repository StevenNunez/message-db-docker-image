FROM postgres:10.6-alpine

RUN apk add --no-cache curl tar
RUN mkdir -p /usr/src/message-db \
    && curl -L https://github.com/message-db/message-db/tarball/4e5b30b -o /usr/src/message-db/message-db.tgz

RUN cd /usr/src/message-db \
    && tar -xvf /usr/src/message-db/message-db.tgz

COPY rundbscripts.sh /docker-entrypoint-initdb.d/

ENV PGDATA /data
RUN docker-entrypoint.sh postgres --version

ENTRYPOINT docker-entrypoint.sh postgres

