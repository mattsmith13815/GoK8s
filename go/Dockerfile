# Use the official Golang image as the base image
FROM golang:1.25 AS builder

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
RUN go build -o gocontainer

# Use a minimal base image for the final container
FROM alpine:3.23.3

# Set the working directory inside the container
WORKDIR /app

# Copy the built binary from the builder stage
COPY --from=builder /app/gocontainer .
COPY ./static /static/

#Install dependencies
RUN apk add libc6-compat

# Run as non-root for OpenShift compatibility
RUN addgroup -S appgroup && adduser -S appuser -G appgroup && chown -R appuser:appgroup /app
USER appuser

# Expose the port your application runs on (if applicable)
EXPOSE 8080

# Command to run the application
CMD ["./gocontainer"]