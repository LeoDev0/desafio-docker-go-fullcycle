FROM golang:1.19.0-alpine AS builder

WORKDIR /src

COPY . .

# Compile reduced file size binary
RUN go build -ldflags "-s -w" -o main

FROM scratch

COPY --from=builder /src/main src/

ENTRYPOINT [ "./src/main" ]
