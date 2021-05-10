FROM amazonlinux:with-sources
LABEL maintainer="Steven Martel <stevenm@playbrain.jp>"

RUN yum update -y
# add nodejs repo
RUN curl --silent --location https://rpm.nodesource.com/setup_10.x | bash -
RUN yum -y install \
  git \
  jq \
  which \
  nodejs \
  openssl-devel \
  python-devel.x86_64 \
  mesa-libGL-devel \
  zip \
  zlib-devel \
  libuuid \
  libXi.so.6 

# install pip + aws cli
RUN curl -O https://bootstrap.pypa.io/pip/2.7/get-pip.py && \
    python get-pip.py
RUN pip install awscli --upgrade

# install python 3
RUN amazon-linux-extras install python3

# update npm to latest version
RUN npm install -g npm

# install serverless framework
RUN npm install -g serverless@1.54.0

