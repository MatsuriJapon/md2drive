FROM ubuntu:18.04

RUN apt update \
    && apt install --no-install-recommends -y wget software-properties-common git-core \
    && add-apt-repository -y ppa:longsleep/golang-backports \
    && apt update \
    && apt --no-install-recommends -y install golang-go \
    && go get github.com/petrpulc/gdrive \
    && mv /root/go/bin/gdrive /usr/bin \
    && wget https://github.com/jgm/pandoc/releases/download/2.6/pandoc-2.6-1-amd64.deb \
    && wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.bionic_amd64.deb \
    && apt install -y fontconfig libfreetype6 libjpeg-turbo8 libpng16-16 libx11-6 libxcb1 libxext6 libxrender1 xfonts-75dpi xfonts-base \
    && dpkg -i pandoc-2.6-1-amd64.deb \
    && dpkg -i wkhtmltox_0.12.5-1.bionic_amd64.deb \
    && apt remove -y --auto-remove software-properties-common golang-go git-core git wget \
    && apt purge -y --auto-remove software-properties-common golang-go git-core git wget \
    && rm -rf /var/lib/apt/lists/* \
    && rm *.deb \
    && mkdir -p /root/.gdrive

COPY md2drive /usr/bin

CMD ["/bin/bash"]