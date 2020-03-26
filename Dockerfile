FROM haskell:8.8.2 as build
ADD ./server/ /work
WORKDIR /work
RUN cabal update
RUN cabal build
RUN cabal install --install-method=copy --installdir=/sbin

FROM ubuntu:18.04
COPY --from=build /sbin/server /sbin/
CMD ["/sbin/server"]

