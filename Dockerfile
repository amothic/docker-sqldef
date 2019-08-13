FROM alpine:3.10 as builder

RUN set -ex \
    && apk add --no-cache curl tar \
    && curl -fSL https://github.com/k0kubun/sqldef/releases/download/v0.4.13/mysqldef_linux_amd64.tar.gz -o mysqldef.tar.gz \
    && mkdir /mysqldef \
    && tar -zxf mysqldef.tar.gz -C /mysqldef

FROM scratch
COPY --from=builder /mysqldef/mysqldef /mysqldef/mysqldef
WORKDIR /mysqldef
ENTRYPOINT ["./mysqldef"]
