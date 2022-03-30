FROM ubuntu:focal
LABEL maintainer="Eifoen <35534229+Eifoen@users.noreply.github.com>"

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
        && apt-get -y install --no-install-recommends tex-common texinfo equivs perl-tk perl-doc wget ca-certificates ghostscript
COPY texlive.profile /

RUN mkdir install-tl && cd install-tl && TZ=Europe/Berlin wget -O - -- http://vesta.informatik.rwth-aachen.de/ftp/pub/mirror/ctan/systems/texlive/tlnet/install-tl-unx.tar.gz | tar xzf - --strip-components=1 && ./install-tl --profile=/texlive.profile --repository=http://vesta.informatik.rwth-aachen.de/ftp/pub/mirror/ctan/systems/texlive/tlnet/ && cd .. && rm -rf install-tl
