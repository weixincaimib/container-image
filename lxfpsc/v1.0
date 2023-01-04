FROM registry.cn-shenzhen.aliyuncs.com/aluopyy/alpine-glibc:3.16-2.34-r0

# Configuration
COPY . .
RUN mkdir /app/lxfpsc && \
    mv lxfpsc /app/lxfpsc/ && \
    mv docker-entrypoint.sh /usr/bin/  && \
    chmod +x /apps/lxfpsc/lxfpsc /usr/bin/docker-entrypoint.sh

ENTRYPOINT [ "docker-entrypoint.sh" ]

CMD /apps/lxfpsc/lxfpsc
