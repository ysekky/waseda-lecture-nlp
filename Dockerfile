FROM jupyter/scipy-notebook

USER root

RUN apt-get update -y --fix-missing && \
  apt-get -y install \
  mecab \
  libmecab-dev \
  mecab-ipadic-utf8 \
  git \
  make \
  curl \
  xz-utils \
  file

RUN git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git /tmp/neologd && \
  cd /tmp/neologd && \
  ./bin/install-mecab-ipadic-neologd -n -u -y && \
  rm -rf /tmp/neologd

RUN pip install -U \
    'natto-py' \
    'gensim==3.7.3'

USER $NB_UID
