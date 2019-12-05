# Many thanks to https://github.com/optiopay/klar for this Dockerfile content
FROM golang:1.8-alpine as builder

RUN apk --update add git;
RUN git clone -b v2.1.1 https://github.com/quay/clair.git
RUN go get -d github.com/optiopay/klar
RUN go build ./src/github.com/optiopay/klar

FROM alpine:3.8

RUN apk add --no-cache ca-certificates
COPY --from=builder /go/klar /klar

ENTRYPOINT ["/klar"]
