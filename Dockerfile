FROM debian
MAINTAINER Alexander Reitzel
ADD script/docker/provision.sh /root/provision.sh
RUN chmod +x /root/provision.sh
RUN /root/provision.sh
ADD . /git-lab-tools
ENTRYPOINT ["/git-lab-tools/bin/glt"]
