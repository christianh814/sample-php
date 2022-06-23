FROM registry.access.redhat.com/ubi8/php-74

USER 0

ADD . /tmp/src

RUN chown -R 1001:0 /tmp/src && \
    chmod -R ug+rwx /tmp/src && \
    rm -f /tmp/src/{Containerfile,README.md}

USER 1001

RUN /usr/libexec/s2i/assemble

CMD /usr/libexec/s2i/run
