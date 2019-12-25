FROM golang:1.8-alpine

# Add git to container
RUN apk --no-cache add git

# Get resume fodder package
RUN go get gitlab.com/steve-perkins/ResumeFodder-cli

WORKDIR /go/src/gitlab.com/steve-perkins/ResumeFodder-cli

# Update resume fodder
RUN git submodule init \
  && git submodule update

# Create resume fodder exacutable
RUN go build -o ResumeFodder

ENTRYPOINT ["./ResumeFodder"]
