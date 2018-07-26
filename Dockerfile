FROM node:9.5.0-alpine AS base
RUN apk add --no-cache git && \
git clone https://github.com/volpe28v/DevHub && \
cd DevHub && \
git checkout 640d26ff5b434162682c78735f03be97c2ef2037  && \
npm install && \
npm run build

FROM base AS release
RUN apk add --no-cache tzdata

COPY --from=base /DevHub /DevHub
WORKDIR /DevHub
EXPOSE 3000

ENTRYPOINT ["npm","start","--"]
