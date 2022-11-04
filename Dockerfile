FROM aabbccsmith/v-alpine:latest as builder

WORKDIR /app

ADD id.v .
ADD v.mod .
RUN v -prod id.v

FROM alpine:latest

WORKDIR /app
COPY --from=builder /app/id .

CMD ["./id"]
