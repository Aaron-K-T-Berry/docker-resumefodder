FROM golang:1.26-alpine

RUN apk --no-cache add git

# Clone ResumeFodder CLI and its library dependency (pre-modules GOPATH layout)
WORKDIR /go/src/gitlab.com/steve-perkins/ResumeFodder-cli
RUN git clone --depth 1 --recurse-submodules \
      https://gitlab.com/steve-perkins/ResumeFodder-cli.git .
RUN git clone --depth 1 \
      https://gitlab.com/steve-perkins/ResumeFodder.git \
      /go/src/gitlab.com/steve-perkins/ResumeFodder

# Create resume fodder executable
ENV GO111MODULE=off
RUN go build -o ResumeFodder

ENTRYPOINT ["./ResumeFodder"]
