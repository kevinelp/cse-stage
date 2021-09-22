#!/bin/sh

set -x

docker run -d --name test-apache \
       -p 8080:80 \
       -v ${PWD}/conf:/usr/local/apache2/conf \
       -v ${PWD}/logs:/usr/local/apache2/logs \
       cse-apache2
