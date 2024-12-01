FROM ruby:3.1.2-slim

WORKDIR /app

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y curl default-mysql-client libjemalloc2 libvips build-essential default-libmysqlclient-dev git pkg-config openssh-client && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives && \
    curl -fsSL https://deb.nodesource.com/setup_22.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g yarn

ENV BUNDLE_PATH="/usr/local/bundle"

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .
