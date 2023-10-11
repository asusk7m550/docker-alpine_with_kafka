# Get the source from golang:1.17-alpine3.16
FROM golang:1.17-alpine3.16

# Install some packages
RUN apk add --no-cache git pkgconf gcc libc-dev g++ bash make

# Build kafka
RUN git clone https://github.com/edenhill/librdkafka.git && cd librdkafka/ && ./configure --prefix /usr && make && make install && cd && rm -rf librdkafka

# Download kafka for golang
RUN go get -tags musl -u gopkg.in/confluentinc/confluent-kafka-go.v1/kafka

# Download logrus, used for logging
RUN go get -v github.com/sirupsen/logrus
