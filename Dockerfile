FROM node:9.5.0-alpine AS base
RUN apk add --no-cache git && \
git clone https://github.com/volpe28v/DevHub && \
cd DevHub && \
git checkout 10e46163fd2721fe505bf3988e7af0d42ad9309d  && \
npm install && \
npm run build

FROM base AS release
RUN apk add --no-cache tzdata

COPY --from=base /DevHub /DevHub
WORKDIR /DevHub
EXPOSE 3000

ENTRYPOINT ["npm","start","--"]
