#!/bin/bash

# FOR LINUX
NETWORK='host'
TARGET_HOST='localhost'
# IMAGES
ELASTIC_STACK_VERSION='6.6.1'

# Run es but disable xpack.security
docker rm -f es.local
docker run -d \
  --rm \
  -p 9200:9200 \
  --name es.local \
  --network $NETWORK \
  -e "xpack.security.enabled=false" \
  -e "http.host=0.0.0.0" \
  -e "transport.host=127.0.0.1" \
  "docker.elastic.co/elasticsearch/elasticsearch:$ELASTIC_STACK_VERSION"

# Wait until it responds
echo "Waiting for elasticsearch to start up..."
until curl --output /dev/null --silent --head --fail http://localhost:9200; do
    printf '.'
    sleep 2
done
echo " "

docker rm -f kibana.local
docker run \
  -d \
  --rm \
  --name kibana.local \
  -e server.name="localhost" \
  --network $NETWORK \
  -p 5601:5601 \
  -e ELASTICSEARCH_URL="http://$TARGET_HOST:9200" \
  "docker.elastic.co/kibana/kibana:$ELASTIC_STACK_VERSION"

  # Wait until it responds
  echo "Waiting for kibana to start up..."
  until curl --output /dev/null --silent --head --fail http://localhost:5601; do
      printf '.'
      sleep 2
  done
  echo " "
