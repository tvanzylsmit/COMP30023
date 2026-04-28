# The testing image will use same distribution as VM (check $ lsb_release -a)
FROM ubuntu:24.04

# The below packages will be present on the testing image
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -yy --no-install-recommends \
        ca-certificates gcc clang make git tree bc valgrind ripgrep net-tools openssh-client \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Rust (comment this out if you don't need it)
# Note: For Rust, cargo and optional tools won't be available in the marking environment
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -yy --no-install-recommends curl \
    && curl -O https://static.rust-lang.org/dist/rust-1.95.0-x86_64-unknown-linux-gnu.tar.gz \
    && tar xf rust-1.95.0-x86_64-unknown-linux-gnu.tar.gz \
    && rm rust-1.95.0-x86_64-unknown-linux-gnu.tar.gz \
    && cd rust-1.95.0-x86_64-unknown-linux-gnu \
    && ./install.sh \
    && cd .. && rm -r rust-1.95.0-x86_64-unknown-linux-gnu \
    && apt-get remove -yy curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /project
