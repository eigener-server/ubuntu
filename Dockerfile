FROM ubuntu:16.04

RUN apt-get update && \
    apt-get -y --no-install-recommends install net-tools tzdata && \
    apt-get clean && \
rm -rf /var/lib/apt/lists/*

# Disable SSH
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh

# Timezone
ENV TZ Europe/Zurich
RUN echo ${TZ} >/etc/timezone && \
    ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata
