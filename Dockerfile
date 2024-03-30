FROM ubuntu:jammy-20240227

WORKDIR /src

RUN apt update

RUN apt-get install -y ninja-build gettext cmake unzip curl 

RUN apt-get install -y git

RUN git clone https://github.com/neovim/neovim

RUN cd neovim && git checkout v0.9.5 && make CMAKE_BUILD_TYPE=RelWithDebInfo

RUN cd neovim && make install

RUN apt-get install -y zsh

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

RUN chsh -s ~/.zshrc

# This is one of the nvim kickstart requirements
RUN apt-get install -y ripgrep

RUN git clone https://github.com/gtorres/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim

CMD [ "zsh" ]
