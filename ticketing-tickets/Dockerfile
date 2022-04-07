FROM golang:alpine AS builder

ENV GO111MODULE=on \
    CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64

WORKDIR /build

COPY go.mod .
COPY go.sum .
RUN go mod download
COPY . .

RUN go build -o main cmd/*/main.go

WORKDIR /dist

RUN cp /build/main .

FROM gcr.io/distroless/static

WORKDIR /app

COPY --from=builder /dist/main .
COPY db/migrations db/migrations

ENTRYPOINT ["/app/main"]

EXPOSE 8080