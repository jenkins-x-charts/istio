FROM centos:7

ENV ISTIO_VERSION 1.5.0

RUN cd /usr/local && \
    curl -LO https://github.com/istio/istio/releases/download/${ISTIO_VERSION}/istio-${ISTIO_VERSION}-linux.tar.gz && \
    tar xzf istio-${ISTIO_VERSION}-linux.tar.gz  && \
    mv istio-${ISTIO_VERSION} istio && \
    make prefix=/usr/local/git all  && \
    make prefix=/usr/local/git install

ENV PATH $PATH:/usr/local/istio/bin

