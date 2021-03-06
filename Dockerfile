FROM biohaz/basic_ubuntu:latest

# Locale
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8


#Install R and Bioconductor with DESeq2

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y libxml2-dev libcurl4-gnutls-dev
RUN apt-get -y install --no-install-recommends --no-install-suggests \
        ca-certificates software-properties-common gnupg2 gnupg1 \
      && apt-key adv --batch --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 \
      && add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/' \
      && apt-get install -y r-base r-base-dev


RUN R -e 'install.packages("BiocManager")'
RUN R -e 'BiocManager::install("DESeq2")'
