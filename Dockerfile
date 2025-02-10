FROM docker:dind

WORKDIR /app

COPY script.sh .

RUN apk add --no-cache bash
#CMD ["bash", "./script.sh"]
CMD ["docker", "run", "hello-world"]
