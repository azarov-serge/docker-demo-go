FROM golang:alpine as build
WORKDIR /go/bin
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build

FROM scratch
WORKDIR /
COPY --from=build /go/bin/docker-demo-go /go/bin/docker-demo-go
ENTRYPOINT ["/go/bin/docker-demo-go"] 
EXPOSE 9000