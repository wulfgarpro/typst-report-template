FROM ghcr.io/typst/typst:0.14.2

ARG PKG_NAME=typst-report-template
ARG PKG_VERSION=0.1.0
ENV TYPST_PACKAGE_PATH=/opt/typst/packages

RUN mkdir -p /opt/typst/packages/local/${PKG_NAME}/${PKG_VERSION}
COPY 0.1.0/ /opt/typst/packages/local/${PKG_NAME}/${PKG_VERSION}

WORKDIR /work
ENTRYPOINT ["typst"]
