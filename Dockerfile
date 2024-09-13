FROM tomcat:9.0
COPY java-tomcat-app/target/java-tomcat-app.war /usr/local/tomcat/webapps/ROOT.war