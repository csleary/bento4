FROM ubuntu AS build
WORKDIR /root/

RUN apt-get update -qq \
  && apt-get -y install \
  unzip \
  wget

RUN wget http://zebulon.bok.net/Bento4/binaries/Bento4-SDK-1-5-1-629.x86_64-unknown-linux.zip \
  && unzip Bento4-SDK-1-5-1-629.x86_64-unknown-linux.zip \
  && mv Bento4-SDK-1-5-1-629.x86_64-unknown-linux bento4 \
  && rm Bento4-SDK-1-5-1-629.x86_64-unknown-linux.zip

FROM ubuntu AS release
COPY --from=build /root/bento4 /root/bento4