FROM openjdk:8-jdk-alpine
RUN apk update && \
apk -Uuv add python py-pip && \
pip install awscli && \
apk --purge -v del py-pip && \
rm /var/cache/apk/*
VOLUME /tmp
EXPOSE 8000
ADD target/*.jar demo-0.0.1-SNAPSHOT.jar
ENV JAVA_OPTS=""
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /demo-0.0.1-SNAPSHOT.jar" ]
