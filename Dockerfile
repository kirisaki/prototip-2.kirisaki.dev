FROM ubuntu:18.04
COPY ./server /sbin/
CMD ["/sbin/server"]

