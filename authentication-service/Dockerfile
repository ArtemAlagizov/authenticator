FROM ruby:2.5.3

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs && gem install bundler
RUN mkdir /authentication-service
WORKDIR /authentication-service

COPY Gemfile /authentication-service/Gemfile
COPY Gemfile.lock /authentication-service/Gemfile.lock

RUN bundle install

COPY . /authentication-service