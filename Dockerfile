FROM node:9.11.1-alpine

LABEL maintainer="Li Chong <delapecci@gmail.com>" \
      org.label-schema.name="Eggjs docker runner" \
      org.label-schema.description="Docker for running eggjs application folder" \
      org.label-schema.vcs-url="https://github.com/delapecci/eggjs-docker" \
      org.label-schema.version=latest \
      org.label-schema.schema-version="1.0"

WORKDIR /usr/src/eggapp

COPY eggapp.sh ./
RUN chmod +x ./eggapp.sh

EXPOSE 7001

COPY healthcheck.js ./
HEALTHCHECK --interval=15s --timeout=5s --start-period=30s \
      CMD node /usr/src/eggapp/healthcheck.js

CMD ["./eggapp.sh"]
