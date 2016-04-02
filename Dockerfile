# SoftEther VPN server
FROM centos:latest
ENV VERSION v4.19-9605-beta-2016.03.06

WORKDIR /usr/local/vpnserver

RUN yum update -y && \
    yum -y install gcc wget make &&\
    yum -y clean all &&\
    wget http://jp.softether-download.com/files/softether/${VERSION}-tree/Linux/SoftEther_VPN_Server/64bit_-_Intel_x64_or_AMD64/softether-vpnserver-${VERSION}-linux-x64-64bit.tar.gz -O /tmp/softether-vpnserver.tar.gz &&\
    tar -xzvf /tmp/softether-vpnserver.tar.gz -C /usr/local/ &&\
    rm /tmp/softether-vpnserver.tar.gz &&\
    make i_read_and_agree_the_license_agreement &&\
    yum -y remove gcc wget make

EXPOSE 443/tcp 992/tcp 1194/tcp 1194/udp 5555/tcp 500/udp 4500/udp

CMD ["./vpnserver", "execsvc"]
