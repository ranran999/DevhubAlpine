FROM node:9.5.0-alpine AS base
RUN apk add --no-cache git && \
git clone https://github.com/volpe28v/DevHub && \
cd DevHub && \
npm install && \
npm run build

FROM base AS release
RUN apk add --no-cache mongodb supervisor tzdata  && \
rm /usr/bin/mongoperf && \
mkdir /etc/supervisord.d

VOLUME /data/db

COPY --from=base /DevHub /DevHub
WORKDIR /DevHub
RUN mkdir -p /var/log/DevHub/

EXPOSE 3000
COPY wait-start.sh .
RUN chmod +x /DevHub/wait-start.sh
COPY supervisord.conf /etc/

ENTRYPOINT ["supervisord", "--nodaemon", "--configuration", "/etc/supervisord.conf"]
