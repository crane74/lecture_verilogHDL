FROM dorowu/ubuntu-desktop-lxde-vnc

RUN apt install wget -y && \
    wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

RUN apt update && apt upgrade -y

RUN apt install -y gtkwave iverilog vim

WORKDIR /usr/src/app