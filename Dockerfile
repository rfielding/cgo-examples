FROM --platform=linux/amd64 ubuntu:23.04

ARG GO=1.20.6

RUN apt update && apt upgrade -y
RUN apt install -y wget make gcc vim

WORKDIR /tmp
RUN wget https://dl.google.com/go/go${GO}.linux-amd64.tar.gz
RUN tar -xvf go${GO}.linux-amd64.tar.gz
RUN mv go /usr/local

RUN echo export GOROOT=/usr/local/go >> ~/.bashrc
RUN echo export GOPATH=\$HOME/go >> ~/.bashrc
RUN echo export PATH=\$GOPATH/bin:\$GOROOT/bin:\$PATH >> ~/.bashrc

WORKDIR /src
