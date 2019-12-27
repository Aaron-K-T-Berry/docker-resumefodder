FROM golang:1.8-alpine

RUN apk --no-cache add git

# Get and setup resume fodder package
RUN go get gitlab.com/steve-perkins/ResumeFodder-cli
WORKDIR /go/src/gitlab.com/steve-perkins/ResumeFodder-cli
RUN git submodule init \
  && git submodule update

# Create resume fodder exacutable
RUN go build -o ResumeFodder

ENTRYPOINT ["./ResumeFodder"]
