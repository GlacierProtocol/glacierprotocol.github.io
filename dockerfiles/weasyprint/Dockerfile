FROM ubuntu

WORKDIR /tmp

# WeasyPrint dependencies
RUN apt-get update && apt-get install -y \
  build-essential\
  python3-dev \
  python3-pip \
  python3-setuptools \
  python3-wheel \
  python3-cffi \
  libcairo2 \
  libpango-1.0-0 \
  libpangocairo-1.0-0 \
  libgdk-pixbuf2.0-0 \
  libffi-dev \
  shared-mime-info \
  wget

# Install WeasyPrint
RUN pip3 install WeasyPrint

# Install Pandoc
# TODO: consider removing since its no longer in use
RUN wget https://github.com/jgm/pandoc/releases/download/2.1.3/pandoc-2.1.3-linux.tar.gz && \
  tar -xzf pandoc-2.1.3-linux.tar.gz && \
  mv pandoc-2.1.3/bin/* /usr/local/bin

ENTRYPOINT ["weasyprint"]
CMD ["--help"]

WORKDIR /src
VOLUME /src
