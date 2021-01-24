FROM ruby:2.6.6
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash - && \
    apt-get install nodejs
RUN gem install bundler --version "1.15.3"
RUN mkdir /sample_app
WORKDIR /sample_app
COPY Gemfile /sample_app/Gemfile
COPY Gemfile.lock /sample_app/Gemfile.lock
RUN bundle install
COPY . /sample_app