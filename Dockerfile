ARG RUBY_VERSION=
FROM ruby:$RUBY_VERSION

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get update && apt-get install less nodejs -y
RUN npm install -g phantomjs-prebuilt
RUN groupadd --gid 1000 ruby && useradd --uid 1000 --gid ruby --shell /bin/bash --create-home ruby
RUN mkdir /app /vendor && chown -R ruby:ruby /app /vendor

ENV LANG=C.UTF-8 \
  BUNDLE_PATH=/vendor/bundle/$RUBY_VERSION \
  BUNDLE_JOBS=4

USER ruby
WORKDIR /app
