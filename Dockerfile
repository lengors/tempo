FROM alpine:3.22.4 AS tools
FROM grafana/tempo:2.10.4

# Copy utilities
COPY --from=tools /usr/bin/wget /usr/bin/wget
COPY --from=tools /bin/cat /bin/cat
COPY --from=tools /bin/sh /bin/sh

# Copy required libraries
COPY --from=tools /lib/ld-musl-*.so.1 /lib/
COPY --from=tools /usr/lib/libssl.so.* /usr/lib/
COPY --from=tools /usr/lib/libcrypto.so.* /usr/lib/
COPY --from=tools /usr/lib/libz.so.1 /usr/lib/
COPY --from=tools /usr/lib/libidn2.so.* /usr/lib/
COPY --from=tools /usr/lib/libpcre2-8.so.* /usr/lib/
COPY --from=tools /usr/lib/libunistring.so.* /usr/lib/
