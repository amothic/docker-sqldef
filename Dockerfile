FROM alpine:3.21 as builder

ARG SQLDEF_TOOL
ARG VERSION
ARG TARGETPLATFORM

RUN set -ex \
    && apk add --no-cache curl tar \
    && curl -fSL https://github.com/sqldef/sqldef/releases/download/${VERSION}/${SQLDEF_TOOL}_linux_${TARGETPLATFORM#*/}.tar.gz -o sqldef.tar.gz \
    && tar -zxf sqldef.tar.gz

FROM scratch

ARG SQLDEF_TOOL
ENV SQLDEF_TOOL=${SQLDEF_TOOL}

COPY --from=builder /${SQLDEF_TOOL} /usr/local/bin/sqldef
ENTRYPOINT ["sqldef"]
