ADD file:5d6b639e8b6bcc01149b7486502558088f9816200063ca72b91a1f989bc8d85e in / 
CMD ["bash"]
ARG RELEASE_VERSION
ENV FLUENT_BIT_VERSION=3.0.2
LABEL description="Fluent Bit multi-architecture debug container image vendor=Fluent Organization version=3.0.2-debug author=Eduardo Silva <eduardo@calyptia.com> org.opencontainers.image.description=Fluent Bit debug container image org.opencontainers.image.title=Fluent Bit Debug org.opencontainers.image.licenses=Apache-2.0 org.opencontainers.image.vendor=Fluent Organization org.opencontainers.image.version=3.0.2-debug org.opencontainers.image.source=https://github.com/fluent/fluent-bit org.opencontainers.image.documentation=https://docs.fluentbit.io/ org.opencontainers.image.authors=Eduardo Silva <eduardo@calyptia.com>"
COPY /usr/bin/qemu-arm-static /usr/bin/ # buildkit
COPY /usr/bin/qemu-aarch64-static /usr/bin/ # buildkit
ENV DEBIAN_FRONTEND=noninteractive
RUN |1 RELEASE_VERSION=3.0.2 /bin/sh -c echo "deb http://deb.debian.org/debian bullseye-backports main" >> /etc/apt/sources.list &&     apt-get update &&     apt-get install -y --no-install-recommends     libssl1.1     libsasl2-2     pkg-config     libpq5     libsystemd0/bullseye-backports     zlib1g     ca-certificates     libatomic1     libgcrypt20     libyaml-0-2     bash gdb valgrind build-essential      git bash-completion vim tmux jq     dnsutils iputils-ping iputils-arping iputils-tracepath iputils-clockdiff     tcpdump curl nmap tcpflow iftop     net-tools mtr netcat-openbsd bridge-utils iperf ngrep     openssl     htop atop strace iotop sysstat ncdu logrotate hdparm pciutils psmisc tree pv     cmake make tar flex bison     libssl-dev libsasl2-dev libsystemd-dev/bullseye-backports zlib1g-dev libpq-dev libyaml-dev postgresql-server-dev-all     && apt-get clean     && rm -rf /var/lib/apt/lists/* # buildkit
RUN |1 RELEASE_VERSION=3.0.2 /bin/sh -c rm -f /usr/bin/qemu-*-static # buildkit
COPY /fluent-bit /fluent-bit # buildkit
EXPOSE map[2020/tcp:{}]
CMD ["/fluent-bit/bin/fluent-bit" "-c" "/fluent-bit/etc/fluent-bit.yaml"]
