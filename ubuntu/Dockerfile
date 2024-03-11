FROM ubuntu:jammy-20240227

WORKDIR /src

RUN apt update

RUN apt-get install -y ninja-build gettext cmake unzip curl 

RUN apt-get install -y git

RUN git clone https://github.com/neovim/neovim

RUN cd neovim && git checkout v0.9.5 && make CMAKE_BUILD_TYPE=RelWithDebInfo

RUN cd neovim && make install
