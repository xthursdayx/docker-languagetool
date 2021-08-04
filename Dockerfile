FROM crazymax/yasu:latest AS yasu
FROM openjdk:16-slim-buster

# see Makefile.version
ARG VERSION

MAINTAINER Silvio Fricke <silvio.fricke@gmail.com>

ENV 

COPY --from=yasu / /

RUN apt-get update && apt-get install -y wget unzip && rm -rf /var/lib/apt/lists/*

RUN wget https://www.languagetool.org/download/LanguageTool-$VERSION.zip && \
    unzip LanguageTool-$VERSION.zip && \
    rm LanguageTool-$VERSION.zip

WORKDIR /LanguageTool-$VERSION

COPY misc/start.sh /start.sh

EXPOSE 8010

ENTRYPOINT [ "/start.sh" ]
CMD [ "sh", "/start.sh" ]
