FROM ubuntu:20.04

ARG USER=user

RUN apt-get update && apt-get install -y \
    apt-utils \
    python \
    micro \
    git \
    curl && \
    apt-get clean && \
    apt-get autoclean && \
    rm -rf /var/cache/* && \
    rm -rf /var/lib/apt/lists/*

RUN curl --proto =https --tlsv1.2 -L https://github.com/ytdl-org/youtube-dl/releases/download/2021.02.10/youtube-dl -o /usr/local/bin/youtube-dl && \
	chmod a+rx /usr/local/bin/youtube-dl

RUN useradd -m -U -s /bin/bash $USER && \
	chown -R $USER:$USER /home/$USER

WORKDIR /home/$USER

COPY ./bash_aliases /home/$USER/.bash_aliases

USER $USER
