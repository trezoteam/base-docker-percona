FROM percona:5.7

RUN apt-get update -y
RUN apt-get install gzip -y

ARG BUILD_PATH
ENV BUILD_PATH "$BUILD_PATH"

ARG DUMP_PATH
ENV DUMP_PATH "$DUMP_PATH"

ADD ${BUILD_PATH}/current_dump.gz /
RUN gunzip current_dump.gz
RUN mv /${DUMP_PATH} schema.sql
RUN mv schema.sql /docker-entrypoint-initdb.d/
