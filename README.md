# DevhubAlpine
Alpine Docker Image of Devhub(development support communication tool for programmers) without mongodb

To run this
```
docker run -d --name mongo  mongo:3.2.19-jessie
docker run -d -p 3000:3000 --link mongo:mongo -e  "MONGODB_URI=mongodb://mongo/some_dbname" -e "TZ=Asia/Tokyo" ranran9/devhub-alpine:noMongodb -t SOME_TITLE
```

## Docker environment variables
| Key        | Value           | Example  |  |
| :------------- |:-------------| :-----|:-----|
| MONGODB_URI      | mongodb://{MONGODB_DOCKER_CONTAINER_NAME}/{DB_NAME} | mongodb://mongo/some_dbname |required |
| TZ     | Timezone      |   Asia/Tokyo ||

## DevHub option
| Option        | Value           | Example  |
| :------------- |:-------------| :-----|
| -t      | {TITLE} | SOME_TITLE |

[Github](https://github.com/ranran999/DevhubAlpine/tree/noMongodb)

#  Alpine Docker with mongodb image

To run this
```
docker run -d -p 3000:3000  -e "DEVHUB_TITLE=TITLE" -e "TZ=Asia/Tokyo" ranran9/devhub-alpine
```
## Docker environment variables
| Key        | Value           | Example  |
| :------------- |:-------------| :-----|
| DEVHUB_TITLE  |   {TITLE} | SOME_TITLE |
| TZ     | Timezone      |   Asia/Tokyo |

[Github](https://github.com/ranran999/DevhubAlpine/)

Official site
https://github.com/volpe28v/DevHub
