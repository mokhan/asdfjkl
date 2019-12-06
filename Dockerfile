FROM ubuntu:bionic
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8
RUN apt-get update -q && apt-get install -y \
  build-essential \
  curl \
  git \
  gnupg2 \
  jq \
  libcurl4 \
  liblttng-ctl-dev \
  liblttng-ctl0 \
  libreadline-dev \
  libssl-dev \
  locales \
  software-properties-common \
  sudo \
  unzip \
  wget \
  zlib1g \
  zlib1g-dev
RUN locale-gen en_US.UTF-8
ENV PATH="${PATH}:/root/.asdf/shims:/root/.asdf/bin"
RUN git clone --depth 1 https://github.com/asdf-vm/asdf.git $HOME/.asdf && \
  echo '. $HOME/.asdf/asdf.sh' >> $HOME/.bashrc && \
  echo '. $HOME/.asdf/asdf.sh' >> $HOME/.profile && \
  asdf plugin-add dotnet-core && \
  asdf plugin-add golang && \
  asdf plugin-add java && \
  asdf plugin-add maven && \
  asdf plugin-add nodejs && \
  asdf plugin-add php && \
  asdf plugin-add python && \
  asdf plugin-add ruby && \
  asdf plugin-add yarn && \
  asdf install dotnet-core 2.1.13 && \
  asdf install dotnet-core 2.2.8 && \
  asdf install dotnet-core 3.1.0 && \
  asdf install golang 1.11.13 && \
  asdf install golang 1.12.14 && \
  asdf install golang 1.13.5 && \
  asdf install java adopt-openjdk-11.0.5+10 && \
  asdf install java adopt-openjdk-12.0.2+10.3 && \
  asdf install java adopt-openjdk-13.0.1+9 && \
  asdf install maven 3.6.3 && \
  asdf install nodejs 11.15.0 && \
  asdf install nodejs 12.13.1 && \
  asdf install nodejs 13.3.0 && \
  asdf install php 7.4.0 && \
  asdf install python 2.7.17 && \
  asdf install python 3.8.0 && \
  asdf install ruby 2.4.5 && \
  asdf install ruby 2.5.7 && \
  asdf install ruby 2.6.5 && \
  asdf install yarn 1.21.0
