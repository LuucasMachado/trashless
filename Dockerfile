FROM ruby:2.6.3
MAINTAINER Campus Code<devs@campuscode.com.br>

ENV NODE_VERSION 8
RUN curl -sL https://deb.nodesource.com/setup_$NODE_VERSION.x | bash -

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list

RUN apt-get update -qq
RUN apt-get install -y --no-install-recommends vim nodejs postgresql-client \
      locales google-chrome-stable imagemagick

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
RUN locale-gen
RUN export LC_ALL="en_US.utf8"

RUN mkdir -p /trashless

WORKDIR /trashless
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN gem install bundler
RUN bundle install
RUN gem install bundler-audit

ADD . /trashless
