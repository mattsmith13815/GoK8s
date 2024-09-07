# Use the official Golang image as the base image
FROM golang:1.20 AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy the Go module files and download dependencies
COPY go.mod go.sum ./
RUN go mod download

# Copy the rest of the application code
COPY . .

# Build the Go application
ENV GOOS=linux
ENV GOARCH=amd64
RUN go build -o dist

# Use a minimal base image for the final container
FROM alpine:latest

# Set the working directory inside the container
WORKDIR /app/dist

# Copy the built binary from the builder stage
COPY --from=builder /app/dist/gocontainer .
COPY ./static ./static

#Install dependencies
RUN apk add libc6-compat

# Expose the port your application runs on (if applicable)
EXPOSE 8080

# Command to run the application
CMD ["./gocontainer"]