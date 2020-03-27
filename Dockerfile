FROM ubuntu:18.04
COPY ./server/server /sbin/
CMD ["/sbin/server"]

