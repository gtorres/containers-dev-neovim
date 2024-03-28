FROM alpine:3.19.1

WORKDIR /src

RUN apk update

RUN apk add build-base cmake coreutils curl unzip gettext-tiny-dev

RUN apk add git

RUN git clone https://github.com/neovim/neovim

RUN cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo

RUN cd neovim && make install

RUN apk add zsh

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# This command `chsh` doesn't work on Alpine but it's ok
#RUN chsh -s ~/.zshrc

# This is one of the nvim kickstart requirements
RUN apk add ripgrep

RUN git clone https://github.com/gtorres/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim

CMD [ "zsh" ]
