#!/bin/sh
set -e

PORT_TO_USE="${PORT:-8080}"

sed -E -i "0,/<Connector port=\"[0-9]+\" protocol=\"HTTP\\\/1\\\.1\"/s//<Connector port=\"${PORT_TO_USE}\" protocol=\"HTTP\\\/1.1\"/" /usr/local/tomcat/conf/server.xml

exec catalina.sh run
