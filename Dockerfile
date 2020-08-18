FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN set -ex; \
    apt-get update \
    && apt-get install -y --no-install-recommends \
        firefox \
	zip \
	unzip \
	p7zip-full \
	git \
	curl \
	dbus-x11 \
        nautilus \
        gedit \
        expect \
        sudo \
        vim \
        bash \
        net-tools \
        novnc \
        socat \
        x11vnc \
	xvfb \
        xfce4 \
        supervisor \
        curl \
        git \
        wget \
        g++ \
        ssh \
        terminator \
        htop \
        gnupg2 \
	locales \
	ibus \
	ibus-clutter \
	ibus-gtk \
	ibus-gtk3 \
	ibus-qt4 \
    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*
RUN dpkg-reconfigure locales

ENV HOME=/root

COPY . /app
RUN chmod +x /app/mc && mv /app/mc /usr/local/bin/
RUN chmod +x /app/conf.d/websockify.sh
RUN chmod +x /app/run.sh
RUN chmod +x /app/expect_vnc.sh
RUN echo "deb http://deb.anydesk.com/ all main"  >> /etc/apt/sources.list
RUN wget --no-check-certificate https://dl.google.com/linux/linux_signing_key.pub -P /app
RUN wget --no-check-certificate -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY -O /app/anydesk.key
RUN apt-key add /app/anydesk.key
RUN apt-key add /app/linux_signing_key.pub
RUN set -ex; \
    apt-get update \
    && apt-get install -y --no-install-recommends anydesk

RUN echo xfce4-session >~/.xsession

CMD ["/app/run.sh"]
