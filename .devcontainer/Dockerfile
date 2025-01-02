FROM ruby:3.3

WORKDIR /workspace

RUN apt-get update -qq && apt-get install --no-install-recommends -y \
    curl \
    openssh-client \
    default-mysql-client \
    tree \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sL https://github.com/hadolint/hadolint/releases/download/v2.8.0/hadolint-Linux-x86_64 -o /usr/local/bin/hadolint \
    && chmod +x /usr/local/bin/hadolint

COPY Gemfile Gemfile.lock ./
RUN bundle install --path 'vendor/bundle'

COPY . .
