FROM rust:1.82.0

# Setup Intel-MKL
WORKDIR /mkl

RUN apt update \
 && apt install -y cpio \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

COPY install-mkl.sh /mkl/
RUN /mkl/install-mkl.sh

# Setup linker to find shared library
COPY intel-mkl.conf /etc/ld.so.conf.d/
RUN ldconfig

# Setup pkg-config
ENV PKG_CONFIG_PATH /opt/intel/mkl/latest/lib/pkgconfig

WORKDIR /src
RUN chmod -R a+w /src

# Setup basic rust development tools
RUN cargo install cargo-tarpaulin
RUN rustup component add rustfmt clippy
