FROM aabbccsmith/v-debian:latest as builder

WORKDIR /app

ADD id.v .
ADD v.mod .
RUN v -prod id.v

FROM debian:latest

WORKDIR /app
COPY --from=builder /app/id .

CMD ["./id"]
