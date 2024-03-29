FROM golang:1.18.2

RUN GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go get -u github.com/prometheus/prometheus/cmd/promtool

FROM alpine:latest  

COPY --from=0 /go/bin/promtool /bin
ENTRYPOINT ["/bin/promtool"]  