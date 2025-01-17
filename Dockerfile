FROM bellsoft/liberica-openjdk-alpine:latest
MAINTAINER oliver egger <oliver.egger@ahdis.ch>
EXPOSE 8080

COPY ./target/matchbox.jar /matchbox.jar

ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'
RUN mkdir -p /data/hapi/lucenefiles && chmod 775 /data/hapi/lucenefiles

ENTRYPOINT java -Xmx1G -jar /matchbox.jar -Dspring.config.additional-location=optional:file:/config/application.yaml,optional:file:application.yaml

# docker build -t hapi-fhir-jpavalidator .
# docker run -p 8080:8080 hapi-fhir-jpavalidator:latest
