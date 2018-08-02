From rocker/tidyverse

# Edit sources list
COPY ./sources.list /etc/apt/

RUN apt-get update && apt-get install -y \
    --allow-unauthenticated \
    --allow-downgrades \ 
    sudo \
    git-core \
    libssl-dev \
    libcurl3-gnutls=7.47.0-1ubuntu2.8 \
    libcurl4-gnutls-dev \
    # for Mongolite
    libsasl2-2=2.1.26.dfsg1-14build1 \
    libsasl2-dev \
    # for DBI
    libjpeg62-dev
  
RUN install2.r --error \
  --deps TRUE \
  # change to China mirror
  -r "http://mirrors.tuna.tsinghua.edu.cn/CRAN/" \
  mongolite \
  DBI \
  yaml \
  plumber 

# Set working directory
WORKDIR /validator

# Add scripts and stuffs
COPY . /validator

#CMD ["Rscript", "--vanilla", "plumber.R", "&"]
