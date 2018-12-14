FROM node:9.5.0-alpine AS base
RUN apk add --no-cache git && \
git clone https://github.com/volpe28v/DevHub && \
cd DevHub && \
git checkout 82be35ca1766b399a29c4ac7a6f25df12452bc13  && \
npm install && \
npm run build

FROM base AS release
RUN apk add --no-cache tzdata

COPY --from=base /DevHub /DevHub
WORKDIR /DevHub
EXPOSE 3000

ENTRYPOINT ["npm","start","--"]
