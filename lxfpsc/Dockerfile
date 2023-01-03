FROM alpine:3.16.2

# Glibc Version
ENV GLIBC_VERSION 2.34-r0

# Glibc Download Url
ARG GLIBC_RUL=https://github.com/sgerrand/alpine-pkg-glibc/releases/download

# Install 
RUN echo -e "http://mirrors.aliyun.com/alpine/v3.16/main\nhttp://mirrors.aliyun.com/alpine/v3.16/community" > /etc/apk/repositories && \
    apk update && \
    apk add curl && \
    apk add tzdata && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    apk del tzdata && \
    wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    wget ${GLIBC_RUL}/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk && \
    wget ${GLIBC_RUL}/${GLIBC_VERSION}/glibc-bin-${GLIBC_VERSION}.apk && \
    wget ${GLIBC_RUL}/${GLIBC_VERSION}/glibc-i18n-${GLIBC_VERSION}.apk && \
    apk add glibc-${GLIBC_VERSION}.apk glibc-bin-${GLIBC_VERSION}.apk glibc-i18n-${GLIBC_VERSION}.apk && \
    /usr/glibc-compat/bin/localedef -i en_US -f UTF-8 en_US.UTF-8 && \
    ln -s /usr/glibc-compat/bin/locale /usr/local/bin/locale && \
    rm /etc/apk/keys/sgerrand.rsa.pub && \
    rm -rf glibc-${GLIBC_VERSION}.apk glibc-bin-${GLIBC_VERSION}.apk glibc-i18n-${GLIBC_VERSION}.apk && \
    mkdir /apps/lxfpsc -p

# Configuration
COPY lxfpsc /apps/lxfpsc/
COPY docker-entrypoint.sh /usr/bin/
RUN chmod +x /apps/lxfpsc/lxfpsc /usr/bin/docker-entrypoint.sh

ENTRYPOINT [ "docker-entrypoint.sh" ]

CMD /apps/lxfpsc/lxfpsc
