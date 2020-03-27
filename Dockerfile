FROM ubuntu:18.04
COPy ./server-exe /sbin/
CMD ["/sbin/server-exe"]

