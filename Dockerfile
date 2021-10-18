# Using following as our base image. TOMCAT_VERSION=10.0.12
FROM tomcat:jre8-openjdk

# Setting some meta data info
LABEL MAINTAINER=suv3ndu@gmail.com

# Copy our WAR file to /usr/local/tomcat/webapps/ of Tomcat container. That is because according to the Tomcat documentation, the War should be placed under CATALINA_BASE/webapps. It will be automatically expanded and deployed. From the Tomcat image documentation, we know that the default path CATALINA_BASE corresponds to /usr/local/tomcat on the container.
COPY HelloDocker.war /usr/local/tomcat/webapps/

# The EXPOSE instruction informs Docker that the container listens on the specified network ports at runtime. (Optional in this case as base Tomcat image already doing it.)
EXPOSE 8080

# The CMD instruction specifies what to run when the container (not the image) is started. There can only be one CMD instruction in a Dockerfile. (Optional in this case as base Tomcat image already doing it.)
CMD ["catalina.sh", "run"]