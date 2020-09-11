FROM ruby:2.7.1

RUN apt-get update && \
    apt-get install -y build-essential \
                       default-mysql-client \
                       --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

ENV APP_PATH=/app
ENV BUNDLE_PATH=$APP_PATH/vendor/bundle

RUN mkdir $APP_PATH
RUN bundle config path $BUNDLE_PATH

WORKDIR $APP_PATH

COPY ./src/Gemfile "${APP_PATH}/Gemfile"
COPY ./src/Gemfile.lock "${APP_PATH}/Gemfile.lock"

RUN gem install bundler --no-document
