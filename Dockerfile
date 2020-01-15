# Start from a Debian image with the latest version of Go installed
# and a workspace (GOPATH) configured at /go.
FROM golang

RUN apt-get update
RUN apt-get upgrade -y

ENV GOBIN /go/bin

RUN go get github.com/chan-vince/maintenance

# Run the outyet command by default when the container starts.
ENTRYPOINT /go/bin/maintenance

# Document that the service listens on port 8080.
EXPOSE 3000