FROM golang:1.20-alpine as builder

WORKDIR /app

COPY . .

RUN go build -o /app/main .

FROM scratch

WORKDIR /app

COPY --from=builder /app/main /app/main

CMD ["/app/main"]
