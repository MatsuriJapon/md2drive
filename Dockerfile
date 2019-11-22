FROM ubuntu:18.04

COPY md2drive /usr/bin

RUN apt-get update \
    && apt-get install --no-install-recommends -y wget software-properties-common git-core fontconfig libfreetype6 libjpeg-turbo8 libpng16-16 libx11-6 libxcb1 libxext6 libxrender1 xfonts-75dpi xfonts-base fonts-takao \
    && fc-cache -f -v \
    && add-apt-repository -y ppa:longsleep/golang-backports \
    && apt-get update \
    && apt-get --no-install-recommends -y install golang-go \
    && go get github.com/petrpulc/gdrive \
    && mv /root/go/bin/gdrive /usr/bin \
    && wget https://github.com/jgm/pandoc/releases/download/2.7.3/pandoc-2.7.3-1-amd64.deb \
    && wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.bionic_amd64.deb \
    && dpkg -i pandoc-*.deb \
    && dpkg -i wkhtmltox_*.deb \
    && apt-get remove -y --auto-remove software-properties-common golang-go git-core git wget \
    && apt-get purge -y --auto-remove software-properties-common golang-go git-core git wget \
    && rm -rf /var/lib/apt/lists/* \
    && rm ./*.deb \
    && mkdir -p /root/.gdrive \
    && chmod +x /usr/bin/md2drive

CMD ["/bin/bash"]