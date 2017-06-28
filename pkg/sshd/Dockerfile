FROM linuxkit/alpine:87a0cd10449d72f374f950004467737dbf440630 as alpine

RUN mkdir -p /out/etc/apk && cp -r /etc/apk/* /out/etc/apk
RUN apk add --no-cache --initdb -p /out \
    git \
    make \
    expect \
    qemu-system-x86_64 \
    qemu-img \
    && true
RUN rm -rf /out/etc/apk /out/lib/apk /out/var/cache

FROM linuxkit/docker-ce:9e125aa533108731d11f6d7ec17aba6ded0cb4eb as docker

FROM linuxkit/sshd:505a985d7bd7a90f15eca9cb4dc6ec92789d51a0

COPY --from=alpine /out /
COPY --from=docker /usr/bin/docker /usr/bin
