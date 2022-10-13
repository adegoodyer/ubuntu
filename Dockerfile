FROM ubuntu:22.04

ENV HOME=/
ENV TMPDIR=/tmp
ENV TZ=Etc/GMT

# set timezone
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# set locale
RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
	&& localedef -i en_GB -c -f UTF-8 -A /usr/share/locale/locale.alias en_GB.UTF-8
ENV LANG en_GB.utf8

# set zero interaction envar during build process only
ARG DEBIAN_FRONTEND=noninteractive

# install dependencies
RUN apt-get update && apt-get install -y \
  curl \
  git \
  rsync \
  wget \
  && rm -rf /var/lib/apt/lists/*

CMD ["bash"]
