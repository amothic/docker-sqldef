FROM alpine:3.19 as builder

ENV VERSION 0.17.8
ARG TARGETPLATFORM

RUN set -ex \
    && apk add --no-cache curl tar \
    && curl -fSL https://github.com/k0kubun/sqldef/releases/download/v$VERSION/mysqldef_linux_${TARGETPLATFORM#*/}.tar.gz -o mysqldef.tar.gz \
    && tar -zxf mysqldef.tar.gz

FROM scratch
COPY --from=builder /mysqldef /usr/local/bin/mysqldef
ENTRYPOINT ["mysqldef"]
