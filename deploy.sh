#!/bin/bash

CATALINA_HOME=/home/ubuntu/application/tomcat

mvn clean package

mv target/kream-1.0.0-BUILD-SNAPSHOT.war $CATALINA_HOME/webapps/ROOT.war

sh $CATALINA_HOME/bin/startup.sh

tail -f $CATALINA_HOME/logs/catalina.out

