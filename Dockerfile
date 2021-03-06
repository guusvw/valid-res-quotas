FROM golang:alpine as builder
WORKDIR $GOPATH/src/github.com/loodse/valid-res-quotas

COPY cmd cmd
COPY vendor vendor
RUN cd cmd && CGO_ENABLED=0 GOOS=linux go build -ldflags="-w -s" -v 

FROM alpine:latest
COPY --from=builder /go/$GOPATH/src/github.com/loodse/valid-res-quotas/cmd/cmd /bin/valid-res-quotas