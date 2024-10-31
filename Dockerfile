FROM ruby:3.1.2-slim

WORKDIR /app

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y curl default-mysql-client libjemalloc2 libvips build-essential default-libmysqlclient-dev git pkg-config && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

ENV RAILS_ENV="development" \
    BUNDLE_PATH="/usr/local/bundle"

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

EXPOSE 3000

CMD ["sh", "-c", "rm -f /app/tmp/pids/server.pid && bundle exec rails s -b '0.0.0.0'"]
