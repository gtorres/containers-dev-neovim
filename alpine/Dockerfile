FROM alpine:3.19.1

WORKDIR /src

RUN apk update

RUN apk add build-base cmake coreutils curl unzip gettext-tiny-dev

RUN apk add git

RUN git clone https://github.com/neovim/neovim

RUN cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo

RUN cd neovim && make install
