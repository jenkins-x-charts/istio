FROM centos:7

# kubectl
ENV KUBECTL_VERSION 1.16.0
RUN curl -LO  https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl && \
  mv kubectl /usr/local/bin/kubectl && \
  chmod +x /usr/local/bin/kubectl

# istioctl
ENV ISTIO_VERSION 1.5.0
RUN cd /usr/local && \
    curl -LO https://github.com/istio/istio/releases/download/${ISTIO_VERSION}/istio-${ISTIO_VERSION}-linux.tar.gz && \
    tar xzf istio-${ISTIO_VERSION}-linux.tar.gz  && \
    mv istio-${ISTIO_VERSION} istio

ENV PATH $PATH:/usr/local/istio/bin

