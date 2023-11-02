FROM alpine

RUN apk update && apk add bash ncurses

# Add the MongoDB package to the apk repositories.
RUN echo "http://dl-cdn.alpinelinux.org/alpine/v3.12/main" >> /etc/apk/repositories
RUN echo "http://dl-cdn.alpinelinux.org/alpine/v3.12/community" >> /etc/apk/repositories

# Install MongoDB tools
RUN apk add --no-cache mongodb-tools

WORKDIR app

ADD . .

CMD bash migrate.sh
