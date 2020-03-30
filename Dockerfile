FROM ubuntu:18.04

RUN mkdir /js

COPY ./client/dist/ /js/

COPY ./server-exe /sbin/

CMD ["/sbin/server-exe"]

