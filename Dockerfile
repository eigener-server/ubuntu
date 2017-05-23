FROM ubuntu:16.04

RUN apt-get update && \
    apt-get -y --no-install-recommends install net-tools && \
    apt-get clean && \
rm -rf /var/lib/apt/lists/*

# Disable SSH
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh

# Timezone
ENV TZ Europe/Zurich
RUN strings -a /lib/x86_64-linux-gnu/libc.so.6 | grep zoneinfo && \
    echo ${$TZ} >/etc/timezone && \
    ln -sf /usr/share/zoneinfo/${$TZ} /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata
