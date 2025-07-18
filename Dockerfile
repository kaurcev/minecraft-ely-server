FROM openjdk:8-jdk

RUN groupadd -g 1000 minecraftserv && \
    useradd -u 1000 -g minecraftserv -d /minecraft -s /bin/bash minecraftserv

WORKDIR /minecraft

RUN apt-get update && apt-get install -y wget

RUN wget https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.12.2-14.23.5.2859/forge-1.12.2-14.23.5.2859-installer.jar -O forge-installer.jar && \
    java -jar forge-installer.jar --installServer && \
    mv forge-1.12.2-14.23.5.2859.jar forge.jar && \
    rm forge-installer.jar

RUN echo "eula=true" > eula.txt

COPY --chown=minecraftserv:minecraftserv authlib-injector-1.2.5.jar ./

RUN chown -R minecraftserv:minecraftserv /minecraft
USER minecraftserv

CMD java $JVM_OPTS -Dfml.queryResult=confirm -javaagent:authlib-injector-1.2.5.jar=ely.by -jar forge.jar nogui
