sudo yum -y install wget java-1.8.0 git

export TOMCAT_VERSION=9.0.46 #Update the new version from http://ftp.cixug.es/apache/tomcat/tomcat-9/

sudo wget http://ftp.cixug.es/apache/tomcat/tomcat-9/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz

tar zxpvf apache-tomcat-${TOMCAT_VERSION}.tar.gz

mv apache-tomcat-${TOMCAT_VERSION} tomcat9

sudo cp $HOME/tomcat-users.xml tomcat9/conf/tomcat-users.xml

sudo cp $HOME/context.xml tomcat9/webapps/manager/META-INF/context.xml

$HOME/tomcat9/bin/startup.sh
