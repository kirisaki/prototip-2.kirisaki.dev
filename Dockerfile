FROM ubuntu:18.04
COPY ./server/server-exe /sbin/
CMD ["/sbin/server-exe"]

