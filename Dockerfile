FROM dorowu/ubuntu-desktop-lxde-vnc

RUN apt install wget -y && \
    wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

RUN apt update && apt upgrade -y

RUN apt install -y gtkwave iverilog vim curl jq

# リリースをAPIから取得し、Ubuntu focal 用にビルドされた最新版の URL を取得してダウンロード
RUN wget -qO- \
  $(curl -s https://api.github.com/repos/chipsalliance/verible/releases | \
  jq -r '.[0].assets[] | \
  select(.name |\
  test("focal-x86_64.tar.gz")) | \
  .browser_download_url ') | \
  tar xvz -C /tmp

# 解凍されたビルド済みのバイナリを移動
RUN mv $(find /tmp -type f | grep "verible" | grep "/bin/") /usr/local/bin

WORKDIR /usr/src/app