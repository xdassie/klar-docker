# Many thanks to https://github.com/optiopay/klar for this Dockerfile content
FROM golang:1.8-alpine as builder

RUN apk --update add git;
RUN go get -d github.com/optiopay/klar
RUN go build ./src/github.com/optiopay/klar

FROM alpine:latest

RUN apk update && apk add --no-cache ca-certificates
COPY --from=builder /go/klar /klar
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
#ENV CLAIR_ADDR=http://clairsvc:6060
ENV KLAR_TRACE=true

ENTRYPOINT ["/entrypoint.sh"]
