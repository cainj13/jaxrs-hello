# Sets up s2i builder

FROM fedora:25
MAINTAINER Josh Cain "jcain@redhat.com"

RUN dnf update -y
RUN dnf install -y java-1.8.0-openjdk maven
RUN dnf clean all -y
