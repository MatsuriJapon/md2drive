FROM ubuntu:18.04

# install pandoc
RUN apt update && apt install -y pandoc
RUN rm -rf /var/lib/apt/lists/*

# TODO
CMD ["/bin/bash"]