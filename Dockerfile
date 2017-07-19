FROM maven:3.5.0-jdk-8 as builder
WORKDIR /opt/build
COPY . /opt/build
RUN mvn package

FROM tomcat:8.0.45-jre8
WORKDIR /usr/local/tomcat
COPY --from=builder /opt/build/target/CMADSession-0.0.22.war webapps
CMD ["catalina.sh", "run"]