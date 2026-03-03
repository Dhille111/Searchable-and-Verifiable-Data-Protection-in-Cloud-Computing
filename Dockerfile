FROM tomcat:9.0-jdk21-temurin

WORKDIR /usr/local/tomcat

COPY . /usr/local/tomcat/webapps/ROOT
COPY render-start.sh /usr/local/tomcat/render-start.sh

RUN chmod +x /usr/local/tomcat/render-start.sh

EXPOSE 8080

CMD ["/usr/local/tomcat/render-start.sh"]
