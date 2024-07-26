# Stage 1: Build the Go app
FROM golang:1.19 AS builder

WORKDIR /app

# Copy go.mod file
COPY go.mod ./

# Download all dependencies. Dependencies will be cached if the go.mod file is not changed
RUN go mod download

# Copy the source code into the container
COPY . .

# Build the Go app
RUN go build -o hello

# Stage 2: Create the final runtime image
FROM alpine:latest

WORKDIR /root/

# Copy the binary from the builder stage
COPY --from=builder /app/hello .

CMD ["./hello"]



