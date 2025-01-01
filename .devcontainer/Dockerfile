FROM ruby:3.3

WORKDIR /workspace

RUN apt-get update -qq && apt-get install --no-install-recommends -y \
    curl \
    openssh-client \
    default-mysql-client \
    tree \
    && rm -rf /var/lib/apt/lists/*

COPY Gemfile Gemfile.lock ./
RUN bundle install --path 'vendor/bundle'

COPY . .
