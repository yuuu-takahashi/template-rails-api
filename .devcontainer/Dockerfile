FROM ruby:3.3

WORKDIR /workspace

RUN apt-get update -qq && apt-get install --no-install-recommends -y \
    curl=7.68.0-1ubuntu2.6 \
    openssh-client=1:8.2p1-4ubuntu0.3 \
    default-mysql-client=1.0.5ubuntu2 \
    tree=1.8.0-1 \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sL https://github.com/hadolint/hadolint/releases/download/v2.8.0/hadolint-Linux-x86_64 -o /usr/local/bin/hadolint \
    && chmod +x /usr/local/bin/hadolint

COPY Gemfile Gemfile.lock ./
RUN bundle install --path 'vendor/bundle'

COPY . .
