FROM ubuntu:20.04

RUN apt update -y && apt install -y sudo curl
# RUN apt update -y && apt install -y git sudo wget zsh &&\
#     chsh -s $(which zsh)

COPY ./ /root/dotfiles

RUN echo y | /root/dotfiles/download.sh

CMD /usr/bin/zsh
