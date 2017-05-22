FROM ubuntu:16.04

RUN apt-get update && \
    apt-get -y --no-install-recommends install net-tools && \
    apt-get clean && \
rm -rf /var/lib/apt/lists/*

# Disable SSH
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh

# Timezone
ENV TZ=Europe/Zurich
RUN ls /usr/share/zoneinfo/ && \
    ls /usr/share/zoneinfo/Europe/ && \
    cp /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    dpkg-reconfigure -f noninteractive tzdata
