# Start from the official Golang base image
FROM golang:1.19

# Set the Current Working Directory inside the container
WORKDIR /app

# Copy the source code into the container
COPY . .

# Build the Go app
RUN go build -o hello .

# Command to run the executable
CMD ["./hello"]
