FROM debian:stable-slim as builder

RUN apt update ; apt install -y build-essential

COPY . /src

RUN cd /src ; make ; make install

FROM debian:stable-slim

COPY --from=builder /usr/local/ /usr/local/

CMD ["/usr/local/bin/make2graph", "--format", "d", "-r"]
