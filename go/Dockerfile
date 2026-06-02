FROM golang:1.24-alpine AS builder

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN go build -o gocontainer .

FROM alpine:3.23.3

WORKDIR /app

COPY --from=builder /app/gocontainer /app/gocontainer
COPY --from=builder /app/go/static /app/static

RUN apk add libc6-compat

RUN addgroup -S appgroup && adduser -S appuser -G appgroup
RUN chown -R appuser:appgroup /app
RUN chmod -R a+rX /app

USER appuser

EXPOSE 8080
CMD ["./gocontainer"]
