#!/bin/bash

isRoot() {
  if [ "$(id -u)" != "0" ]; then
   echo "***isRoot*** This script must be run as root" 1>&2
   exit 1
 fi
}

createAppsDir () {
  echo "***createAppsDir*** Creating /opt" 1>&2
  $(isRoot)
  mkdir /opt
  echo "***createAppsDir*** done" 1>&2
}

changeAppsRights () {
  echo "***changeAppsRights*** Change access rights to /opt" 1>&2
  $(isRoot)
  chmod -R 777 /opt
  echo "***changeAppsRights*** done" 1>&2
}

#installCassandra () {
  #echo "***installCassandra*** Installing Cassandra" 1>&2
  #cd /opt
  #curl -O http://www.us.apache.org/dist/cassandra/2.2.3/apache-cassandra-2.2.3-bin.tar.gz
  #tar -xvzf apache-cassandra-2.2.3-bin.tar.gz
  #rm apache-cassandra-2.2.3-bin.tar.gz
  #ln -s /opt/apache-cassandra-2.2.3 /opt/cassandra
  #echo "***installCassandra*** done" 1>&2
#}

installJdk8 () {
  echo "***installJdk*** Installing Oracle Jdk8" 1>&2
  cd /opt
  curl -O http://download.oracle.com/otn-pub/java/jdk/8u65-b17/jdk-8u65-linux-x64.tar.gz
  tar zxvf jdk-8u65-linux-x64.tar.gz
  rm jdk-8u65-linux-x64.tar.gz
  ln -s /opt/jdk1.8.0_65 /opt/jdk8
  alternatives --set java /opt/jdk8/bin
  echo "***installJdk*** done" 1>&2
}

installCassandraAdmin () {
  echo "***installCassandraAdmin*** Installing Cassandra Admin Tool" 1>&2
  cd /opt
  git clone https://github.com/sebgiroux/Cassandra-Cluster-Admin.git
  echo "***installCassandraAdmin*** done" 1>&2
}

installMaven () {
  echo "***installMaven*** Installing Maven" 1>&2
  cd /opt
  curl -O http://apache.mirrors.ovh.net/ftp.apache.org/dist/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz
  tar zxvf apache-maven-3.3.3-bin.tar.gz
  rm apache-maven-3.3.3-bin.tar.gz
  ln -s /opt/apache-maven-3.3.3 /opt/maven
  echo "***installMaven*** done" 1>&2
}

installTomcat () {
  echo "***installTomcat*** Installing Tomcat" 1>&2
  cd /opt
  curl -O http://mirrors.ircam.fr/pub/apache/tomcat/tomcat-8/v8.0.30/bin/apache-tomcat-8.0.30.tar.gz
  tar zxvf apache-tomcat-8.0.30.tar.gz
  rm apache-tomcat-8.0.30.tar.gz
  ln -s /opt/apache-tomcat-8.0.30 /opt/tomcat
  echo "***installTomcat*** done" 1>&2
}

installDevCenter () {
  echo "***installDevCenter*** Installing Dev Center" 1>&2
  cd /opt
  curl -O http://downloads.datastax.com/devcenter/DevCenter-1.5.0-linux-gtk-x86_64.tar.gz
  tar -xvzf  DevCenter-1.5.0-linux-gtk-x86_64.tar.gz
  rm DevCenter-1.5.0-linux-gtk-x86_64.tar.gz
  ln -s /opt/DevCenter /opt/devcenter
  echo "***installDevCenter*** done" 1>&2
}

installVSCode () {
  echo "***installVSCode*** Installing VS Code" 1>&2
  cd /opt
  curl -O https://az764295.vo.msecnd.net/public/0.9.1/VSCode-linux64.zip
  unzip VSCode-linux64.zip
  rm VSCode-linux64.zip
  ln -s /opt/VSCode-linux-x64 /opt/VSCode
  echo "***installVSCode*** done" 1>&2
}

installNetbeans () {
  echo "***installNetbeans*** Installing Unity tweak tools" 1>&2
  cd /opt
  curl -O http://download.netbeans.org/netbeans/8.1/final/bundles/netbeans-8.1-linux.sh
  chmod +x netbeans-8.1-linux.sh
  ./netbeans-8.1-linux.sh
  echo "***installNetbeans*** done" 1>&2
}

installIdea () {
  echo "***installIdea*** Installing Idea" 1>&2
  cd /opt
  curl -O https://d1opms6zj7jotq.cloudfront.net/idea/ideaIC-14.1.5.tar.gz
  tar zxvf ideaIC-14.1.5.tar.gz
  rm ideaIC-14.1.5.tar.gz
  ln -s /opt/idea-IC-141.2735.5 /opt/idea

  echo "[Desktop Entry]" >> /usr/share/applications/idea.desktop
  echo "Type=Application" >> /usr/share/applications/idea.desktop
  echo "Terminal=true" >> /usr/share/applications/idea.desktop
  echo "Name=Idea" >> /usr/share/applications/idea.desktop
  echo "Icon=/opt/idea/bin/idea.png" >> /usr/share/applications/idea.desktop
  echo "Exec=/opt/idea/bin/idea.sh" >> /usr/share/applications/idea.desktop
  cat .bashrc-root >> ~/.bashrc

  echo "***installIdea*** done" 1>&2
}

installEclipse () {
  echo "***installEclipse*** Installing Eclipse" 1>&2
  cd /opt
  curl -O http://download.springsource.com/release/ECLIPSE/mars/1/eclipse-jee-mars-1-linux-gtk-x86_64.tar.gz
  tar zxvf eclipse-jee-mars-1-linux-gtk-x86_64.tar.gz
  rm eclipse-jee-mars-1-linux-gtk-x86_64.tar.gz
  mv /opt/eclipse /opt/eclipse-mars
  ln -s /opt/eclipse-mars /opt/eclipse
  echo "***installEclipse*** done" 1>&2
}

installSts () {
  echo "***installSts*** Installing STS" 1>&2
  cd /opt
  curl -O http://dist.springsource.com/release/STS/3.7.2.RELEASE/dist/e4.5/spring-tool-suite-3.7.2.RELEASE-e4.5.1-linux-gtk-x86_64.tar.gz
  tar zxvf spring-tool-suite-3.7.2.RELEASE-e4.5.1-linux-gtk-x86_64.tar.gz
  rm spring-tool-suite-3.7.2.RELEASE-e4.5.1-linux-gtk-x86_64.tar.gz
  ln -s /opt/sts-bundle/sts-3.7.2.RELEASE /opt/sts
  echo "***installSts*** done" 1>&2
}

installPlay2 () {
  echo "***installPlay2*** Installing Play2" 1>&2
  cd /opt
  wget https://downloads.typesafe.com/typesafe-activator/1.3.7/typesafe-activator-1.3.7-minimal.zip
  unzip typesafe-activator-1.3.7-minimal.zip
  rm typesafe-activator-1.3.7-minimal.zip
  ln -s /opt/activator-1.3.7-minimal /opt/activator
  echo "***installPlay2*** done" 1>&2
}

addToPath () {
  echo "***addToPath*** Adding apps to PATH" 1>&2

#  echo "export PATH=/opt/VSCode:$PATH" >> ~/.bashrc
#  echo "export PATH=/opt/idea:$PATH" >> ~/.bashrc
  echo "export PATH=/opt/sts:$PATH" >> ~/.bashrc
#  echo "export PATH=/opt/cassandra/bin:$PATH" >> ~/.bashrc
  echo "export PATH=/opt/devcenter/bin:$PATH" >> ~/.bashrc
  echo "export PATH=/opt/tomcat/bin:$PATH" >> ~/.bashrc
  echo "export PATH=/opt/maven/bin:$PATH" >> ~/.bashrc
#  echo "export PATH=/opt/activator:$PATH" >> ~/.bashrc

#  echo "export NPM_PACKAGES=${HOME}/.npm-global-pkg" >> ~/.bashrc
#  echo "export NODE_PATH=$NPM_PACKAGES/lib/node_modules:$NODE_PATH" >> ~/.bashrc
#  echo "export PATH=$NPM_PACKAGES/bin:$PATH" >> ~/.bashrc

  echo "***addToPath*** done" 1>&2
}
