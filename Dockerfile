FROM get-ready/base 

RUN apt-get update && apt-get install -y git

RUN mkdir /tools && \
    cd /tools && \
    git clone https://github.com/bats-core/bats-core.git && \
    cd bats-core && \
    ./install.sh /usr/local