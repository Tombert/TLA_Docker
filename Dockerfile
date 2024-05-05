FROM ubuntu AS build
RUN apt-get update && apt-get install -y build-essential libz-dev wget unzip openjdk-11-jre-headless  --no-install-recommends

# Based on https://tla.msr-inria.inria.fr/tlaps/content/Download/Source.html

WORKDIR /tmp
RUN wget https://github.com/tlaplus/tlaplus/releases/download/v1.7.1/TLAToolbox-1.7.1-linux.gtk.x86_64.zip -O tla.zip

WORKDIR /opt
RUN unzip /tmp/tla.zip
RUN ls /opt

# # Instructions don't mention this, but you get an error about missing "ls4" and
# # I found this on GitHub...
# WORKDIR /tmp
# RUN wget https://github.com/quickbeam123/ls4/archive/v1.0.tar.gz
# RUN tar xf v1.0.tar.gz
# RUN make -C ls4-1.0/core rs



FROM ubuntu
ADD LICENSE /TLA-LICENSE
ENV CLASSPATH=/opt/tla
RUN apt-get update && apt-get install -y  texlive-latex-base openjdk-11-jre-headless --no-install-recommends
# TLC and TLATEX:
COPY --from=build /opt/toolbox/tla2tools.jar /opt/tla.jar
WORKDIR /model
ENTRYPOINT ["java", "-XX:+UseParallelGC", "-jar", "/opt/tla.jar"]
