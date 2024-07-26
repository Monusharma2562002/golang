FROM golang:1.19 AS builder
WORKDIR /app
COPY go.mod ./
RUN go mod download
COPY . .
RUN go build -o hello
FROM alpine:latest
WORKDIR /root/
COPY --from=builder /app/hello .
CMD ["./hello"]
