# Get the source from golang:alpine
FROM golang:alpine

# Install some packages
RUN apk add --no-cache git pkgconf gcc libc-dev g++ bash make

# Build kafka
RUN git clone https://github.com/edenhill/librdkafka.git && cd librdkafka/ && ./configure --prefix /usr && make && make install && cd && rm -rf librdkafka

# Download kafka for golang
RUN go get -v github.com/confluentinc/confluent-kafka-go/kafka
