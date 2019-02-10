FROM ubuntu:18.04

# install pandoc
RUN apt update \
    && apt install --no-install-recommends -y pandoc software-properties-common git-core \
    && add-apt-repository -y ppa:longsleep/golang-backports \
    && apt update \
    && apt --no-install-recommends -y install golang-go \
    && go get github.com/petrpulc/gdrive \
    && mv /root/go/bin/gdrive /usr/bin \
    && apt remove -y --auto-remove software-properties-common golang-go git-core \
    && apt purge -y --auto-remove software-properties-common golang-go git-core \
    && rm -rf /var/lib/apt/lists/*

# TODO
CMD ["/bin/bash"]