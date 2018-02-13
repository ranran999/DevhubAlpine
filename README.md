# DevhubAlpine
Alpine Docker File of Devhub(development support communication tool for programmers) without mongodb

To run this
```
docker run -d --name mongo  mongo:3.2.19-jessie
docker run -it --rm -p 3000:3000  --link mongo:mongo -e  "MONGODB_URI=mongodb://mongo/some_dbname" -e "TZ=Asia/Tokyo" ranran9/devhub-alpine:noMongodb -t SOME_TITLE
```
https://github.com/volpe28v/DevHub
