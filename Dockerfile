FROM ubuntu:18.04
COPY ./server-exe /sbin/
CMD ["/sbin/server-exe"]

