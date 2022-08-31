FROM golang:1.19.0-alpine AS builder

WORKDIR /src

COPY . .

RUN go build -o main

FROM gcr.io/distroless/static-debian11

COPY --from=builder /src/main src/

ENTRYPOINT [ "./src/main" ]
