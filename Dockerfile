FROM jenkins:latest

USER root

RUN wget http://www.dotdeb.org/dotdeb.gpg \
    && apt-key add dotdeb.gpg \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 \
    && rm dotdeb.gpg \
    && echo 'deb http://packages.dotdeb.org jessie all' >> /etc/apt/sources.list \
    && echo 'deb-src http://packages.dotdeb.org jessie all' >> /etc/apt/sources.list

RUN apt-get update \
    && apt-get install -y \
        openssl \
        build-essential \
        libssl-dev \
        libffi-dev \
        python-dev \
        php7.0 \
        php7.0-mysql \
        php7.0-mbstring \
        php7.0-iconv \
        php7.0-mcrypt \
        php7.0-dom \
        php7.0-posix \
        php7.0-xdebug \
        php7.0-curl

RUN wget https://bootstrap.pypa.io/get-pip.py \
    && python get-pip.py \
    && pip install ansible \
    && rm get-pip.py

USER jenkins
